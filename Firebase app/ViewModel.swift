//
//  ViewModel.swift
//  Firebase app
//
//  Created by Aaron Xue on 2021/5/27.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift

class ViewModel: ObservableObject {
    @Published var cardData: [Card] = []
        
    func writeData(name: String, strFinish: String, date: Date){
//        let isFinished = (strFinish == "True" || strFinish == "是") ? true : false
//
//        let card = Card(name: name, isFinished: isFinished, date: date)
//
//        let db = Firestore.firestore()
//        do { let docRef = try db.collection("todos").addDocument(from: card)
//            print(docRef.documentID)
//        } catch {
//            print(error)
//        }
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
