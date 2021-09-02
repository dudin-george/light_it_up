//
//  GlobalNewsView.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 06.08.2021.
//

import SwiftUI

struct GlobalNewsCard: View {
    
    var news: GlobalNews
    var height: CGFloat
    
    private let gradient = Gradient(colors: [Color.init(#colorLiteral(red: 0.2823529412, green: 0.2823529412, blue: 0.2823529412, alpha: 0.3)), Color.init(#colorLiteral(red: 0.2823529412, green: 0.2823529412, blue: 0.2823529412, alpha: 0.9))])
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: gradient, startPoint: .leading, endPoint: .trailing)
                .cornerRadius(25)
            VStack(alignment: .leading) {
                HStack {
                    
                    CustomButtonTag(title: news.tag, colorBorder: Color.white, padding: 10, colorTitle: Color.white)
                    
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text(news.authorString)
                            .font(.headline)
                        Text(news.dateString)
                    }
                }
                Spacer()
                Text(news.title)
                    .font(.headline)
                Text(news.description)
            }
            .padding()
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: height)
    }
}
