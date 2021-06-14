//
//  AddNewNote.swift
//  Firebase app
//
//  Created by Aaron Xue on 2021/6/14.
//

import SwiftUI

struct AddNewNote: View {
    @Binding var isUploadShow: Bool
    @State private var title_add = ""
    @State private var subtitle_add = ""
    @State private var briefSummary_add = ""
    @State private var description = ""
    @State private var pic=Image(systemName: "square.and.arrow.up")
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        if let image = info[.originalImage] as? Image {
            pic = image
        }
        
        picker.dismiss(animated: true)
        
    }
    let imagePickerController = UIImagePickerController()
    func tapPhotoPickImageView(){
        let controller = UIAlertController(title: "拍照?從照片選取?從相簿選取?", message: "", preferredStyle: .alert)
        controller.view.tintColor = UIColor.gray
        
        // 相機
        let cameraAction = UIAlertAction(title: "相簿", style: .default) { _ in
            self.takePicture()
        }
        controller.addAction(cameraAction)
        
        // 圖庫
        let photoLibraryAction = UIAlertAction(title: "照片", style: .default) { _ in
            self.openPhotoLibrary()
        }
        controller.addAction(photoLibraryAction)
        
        let cancelAction = UIAlertAction(title: "取消", style: .destructive, handler: nil)
        controller.addAction(cancelAction)
    }
    
    /// 開啟相機
    func takePicture() {
        imagePickerController.sourceType = .savedPhotosAlbum
        
    }
    
    /// 開啟圖庫
    func openPhotoLibrary() {
        imagePickerController.sourceType = .photoLibrary
        
    }
    
    
    var body:some View{
        VStack{
            HStack{
                Text("標題：")
                TextField("請輸入標題：",text:$title_add)
            }
            HStack{
                Text("子標題：")
                TextField("請輸入子標題：",text:$subtitle_add)
            }
            HStack{
                Text("簡要：")
                TextField("請輸入簡要：",text:$subtitle_add)
            }
            HStack{
                Text("內容：")
                TextField("請輸入內容：",text:$subtitle_add)
                
            }
            HStack{
                Button(action: {tapPhotoPickImageView()}, label: {
                    Text("加入照片")
                })
            }
        }
    }
}
