//
//  CameraTestView.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 31.07.2021.
//

import SwiftUI

struct NewsCreationView: View {
    
    @State private var isShowPhotoLibrary = false
    @State private var image: UIImage = UIImage(named: "testing")!
    
    @State private var titleStr = ""
    @State private var descriptionStr = ""
    @State private var projectID = ""
    @State private var authorID = ""
    
    var body: some View {
        ScrollView {
            
            TextField("ID проекта", text: $projectID)
                .padding()
                .keyboardType(.decimalPad)
            
            TextField("ID автора", text: $authorID)
                .padding()
                .keyboardType(.decimalPad)
            
            TextField("Заголовок новости", text: $titleStr)
                .padding()
                
            
            TextField("Описание", text: $descriptionStr)
                .padding()
            
            Image(uiImage: self.image)
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                    
            Button(action: {
                self.isShowPhotoLibrary = true
            }) {
                
                Text("Photo library")
                    .font(.headline)
                    .frame(width: 400, height: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .padding(.horizontal)
                }
            Button(action: {
                let parameters = ["title": titleStr, "description" : descriptionStr, "project" : projectID, "author": authorID]
                let postAPI = PostAPI()

                postAPI.post(URL(string: "http://89.223.122.31:8000/api/news/")!, parameters: parameters, image:  image, fileName: "test_photo.png", imageParametr: "pictures")
            }) {
                Text("Send news")
                    .font(.headline)
                    .frame(width: 250, height: 50)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .padding()
            }
        }
        .sheet(isPresented: $isShowPhotoLibrary) {
            ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
        }
    }
}

struct CameraTestView_Previews: PreviewProvider {
    static var previews: some View {
        NewsCreationView()
    }
}
