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
    @State private var isShowPhotoLibrary = false
    @State private var image = UIImage()
    
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
               Button(action: {
                   self.isShowPhotoLibrary = true
               }) {
                   HStack {
                       Image(systemName: "photo")
                           .font(.system(size: 20))
                   }
                   .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 30)
                   .background(Color.blue)
                   .foregroundColor(.white)
                   .cornerRadius(20)
                   .padding(.horizontal)
               }
                Image(uiImage: self.image)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100, alignment: .center)
                .edgesIgnoringSafeArea(.all)
           }
           .sheet(isPresented: $isShowPhotoLibrary) {
                ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
           }
        }
    }
}
