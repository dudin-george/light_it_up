//
//  ProjectCreationView.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 31.07.2021.
//

import SwiftUI

struct ProjectCreationView: View {
    @State private var isShowPhotoLibrary = false
    @State private var image: UIImage = UIImage(named: "testing")!
    
    @State private var titleStr = ""
    @State private var descriptionStr = ""
    @State private var mainIdeaStr = ""
    @State private var country = "Russia"
    @State private var city = "Krasnodar"
    
    var body: some View {
        ScrollView {
            
            TextField("Название", text: $titleStr)
                .padding()
                
            TextField("Главная идея", text: $mainIdeaStr)
                .padding()
            
            TextField("Описание", text: $descriptionStr)
                .padding()
            
            TextField("Страна", text: $country)
                .padding()
            
            TextField("Город", text: $city)
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
                let parameters: [String : Any] = ["title": titleStr, "description" : descriptionStr, "city" : city, "country": country, "tags": ["Space", "Moon", "Mars"], "vacancies": ["HR"], "main_idea": mainIdeaStr]
                let postAPI = PostAPI()

                postAPI.post(URL(string: "http://89.223.122.31:8000/api/projects/")!, parameters: parameters, image:  image, fileName: "test_photo.png", imageParametr: "pictures")
            }) {
                Text("Send project")
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

struct ProjectCreationView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectCreationView()
    }
}
