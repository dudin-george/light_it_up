//
//  UserCreationView.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 31.07.2021.
//

import SwiftUI

struct UserCreationView: View {
    
    @State private var isShowPhotoLibrary = false
    @State private var image: UIImage = UIImage(named: "testing")!
    
    @State private var name = "Al"
    @State private var surname = "Og"
    @State private var phone = "89184168412"
    @State private var birthday: Date = Date()
    
    var body: some View {
        ScrollView {
            Text("Раздел пока не работает из-за даты Иные поля проставлены по умолчанию")
                .font(.headline)
            
            TextField("Телефон", text: $phone)
                .keyboardType(.phonePad)
                .padding()
            
            TextField("Имя", text: $name)
                .padding()
            
            TextField("Фамилия", text: $surname)
                .padding()
            
            DatePicker("День рождения", selection: $birthday, displayedComponents: [.date])
                .font(.headline)
                .accentColor(.white)
                .foregroundColor(.white)
                .padding()
                .background(Color.yellow)
                .cornerRadius(10)
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
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .padding(.horizontal)
                }
            Button(action: {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                let birthdayStr: String = dateFormatter.string(from: birthday)
                let parameters: [String: Any] = ["phone": phone, "name" : name, "surname" : surname, "birthday": birthdayStr, "country": "Russia", "city": "Krasnodar", "profession": "HR", "tags": ["Space"], "languages": ["RU"], "education": "MSU", "portfolio": "https://github.com/", "description": "descr"]
                let postAPI = PostAPI()
                postAPI.post(URL(string: "http://89.223.122.31:8000/api/users/")!, parameters: parameters, image:  image, fileName: "test_photo.png", imageParametr: "photos")
            }) {
                Text("Send user")
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

struct UserCreationView_Previews: PreviewProvider {
    static var previews: some View {
        UserCreationView()
    }
}
