//
//  SimpleManager.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 29.07.2021.
//

import SwiftUI
import Combine

struct SimpleManager: View {
    
    @ObservedObject private var model = ProjectViewModelAPI()
    @State private var id: String = "1"
    var body: some View {
        VStack {
            TextField("Введите id проекта", text: $id)
                .padding()
            
            Button( action: {
                model.idProject = Int(id)!
            }) {
                Text("Получить проект с id = " + id)
                    .font(.headline)
                    .frame(width: 250, height: 50)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .padding()
            }
            
            if model.project != nil {
                projectView(project: model.project!)
            } else {
                Text("Проект не найден/нажми красную кнопку")
            }
            Spacer()
        }
    }
    
    private func projectView(project: Project) -> some View {
        return ScrollView {
            Text("Проект с ID \(project.id)")
                .padding()
            Text("Заголовок: \(project.title)")
            Text("Описание: \(project.description)")
            Text("Идея: \(project.mainIdea)")
            PosterImage(imageLoader: ImageLoader(url: URL(string: project.pictures)))
                .padding()
            newsView(news: project.news)
                .padding(.bottom, 100)
        }
        .padding()
    }
    
    private func newsView(news: [News]) -> some View {
        return VStack {
            ForEach((0..<news.count), id: \.self) { i in
                VStack {
                    Text("Новость под номером \(i + 1)")
                    Text("Заголовок: \(news[i].title)")
                    Text("Описание: \(news[i].description)")
                    PosterImage(imageLoader: ImageLoader(url: URL(string: "http://89.223.122.31:8000" + news[i].imageURL)))
                }
                .padding()
            }
        }
    }
    
}

struct SimpleManager_Previews: PreviewProvider {
    static var previews: some View {
        SimpleManager()
    }
}

extension Data {

    mutating func appendString(string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: true)
        append(data!)
    }
}
