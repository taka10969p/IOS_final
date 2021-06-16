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
            Text("Create").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).padding().accentColor(Color.blue)
            HStack{
                FloatingTextField($title_add,placeholder: "標題").icon(systemName: "bubble.left").accentColor(Color.purple).autocapitalization(.none).padding()
            }
            HStack{
                
                FloatingTextField($subtitle_add,placeholder: "子標題").icon(systemName: "paperclip").accentColor(Color.orange).autocapitalization(.none).padding()
            }
            HStack{
                FloatingTextField($briefSummary_add,placeholder: "簡要").icon(systemName: "pencil.circle").accentColor(Color.red).autocapitalization(.none).padding()
            }
            HStack{
                FloatingTextField($description,placeholder: "內容").styled(FloatingTextFieldStyle.square).accentColor(Color.green).padding()
            }
            HStack{
                Button(action: {
                    self.isShowPhotoLibrary = true
                }) {
                    HStack {
                        Image(systemName: "photo")
                            .font(.system(size: 20))
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                }
            }
            .sheet(isPresented: $isShowPhotoLibrary) {
                ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
            }

            Spacer()
            HStack{
                Image(uiImage: self.image)
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: 150, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .edgesIgnoringSafeArea(.all).padding()
            }
            Spacer()
        }
        Button(action: {
            isUploadShow = false
            ViewModel().writeData(subtitle: subtitle_add, title: title_add, briefSummary: briefSummary_add, description: description, image: image)
        }){
            Text("Add new note")
        }
    }
}
