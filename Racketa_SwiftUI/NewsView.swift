//
//  NewsView.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 05.08.2021.
//

import SwiftUI

struct NewsView: View {
    
    private let globalNews = GlobalNews(id: 0, title: "Что произошло в мире науки. Вечерний дайджест", description: "Ухудшение когнитивных функций после коронавируса, молочная железа в подмышке, а также приложение, которое определяет, не испытывает ли кошка боль", tag: "Наука", authorString: "Интерфакс", date: Date(timeIntervalSince1970: 1000), color: Color.orange)
    
    private let tags: [String] = ["FinTesh", "MedTesh", "IT", "UI/UX",
                                  "Swift", "C++", "ML"]
    
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea(.all)
            globalNewsView()
        }
    }
    
    private func globalNewsView() -> some View {
        return ScrollView {
            VStack(alignment: .leading){
                GlobalNewsView(news: globalNews, height: 200)
                Text("Рекомендаци для вас")
                    .foregroundColor(.white)
                ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach((0..<tags.count), content: { i in
                                CustomButtonTag(title: tags[i], colorBorder: Color.white, padding: 10, colorTitle: Color.white)
                                    .padding(.vertical)
                                    .padding(.horizontal, 2)
                            })
                        }
                    }
                    
                ScrollView() {
                    ForEach((0..<10), content: {
                        _ in
                        GlobalNewsView(news: globalNews, height: 200)
                    })
                }
            }
            .padding()
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
