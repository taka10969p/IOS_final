//
//  ViewModel.swift
//  Firebase app
//
//  Created by Aaron Xue on 2021/5/27.
//

import Foundation
import FirebaseCore
import FirebaseStorage
import FirebaseFirestore
import FirebaseFirestoreSwift

class ViewModel: ObservableObject {
    @Published var cardData: [Card] = []
        
    func writeData(subtitle: String, title: String, briefSummary: String, description: String, image: UIImage){
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH-mm-ss"
        
        let im: UIImage = image
        guard let d: Data = im.jpegData(compressionQuality: 1) else { return }
        
        let md = StorageMetadata()
        md.contentType = "image/png"
        

        let ref = Storage.storage().reference().child(formatter.string(from: date)+".png")
                
        ref.putData(d, metadata: md) { (metadata, error) in
             if error == nil {
                ref.downloadURL(completion: { (url, error) in
                    print("Done, url is \(String(describing: url))")
                    
                    let card = Card(subtitle: subtitle, title: title, backgroundImage: url!.absoluteString, briefSummary: briefSummary, description: description, date: date)
                    
                    self.cardData.append(card)

                    let db = Firestore.firestore()
                    do { let docRef = try db.collection("todos").addDocument(from: card)
                        print(docRef.documentID)
                    } catch {
                        print(error)
                    }
                 })
             }else{
                 print("error \(String(describing: error))")
             }
         }
    }
    
    func readData() {
        let db = Firestore.firestore()
        let ref = db.collection("todos")
        ref.getDocuments{ (snapshot, err) -> Void in
            guard let snapshot = snapshot else { return }
            
            let cs = snapshot.documents.compactMap{
                snapshot in try? snapshot.data(as: Card.self)
            }
            
            print(cs)
            
            self.cardData = cs
        }
    }
}
