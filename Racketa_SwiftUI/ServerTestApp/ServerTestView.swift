//
//  ServerTestView.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 31.07.2021.
//

import SwiftUI

struct ServerTestView: View {
    @State var selected = 0
    private let viewsTitles = ["Проект", "Создать новость", "Статистика"]
    
    var body: some View {
        ZStack {
            
            if selected == 0 {
                SimpleManager()
            } else if selected == 1 {
                CreationView()
            } else if selected == 2 {
                Text("Coming soon")
            }
            
            VStack {
                Spacer()
                CustomTabBar(selected: $selected, titles: viewsTitles, firstColor: .blue, secondColor: .gray)
                    .padding()
                    .padding(.horizontal, 32)
                    .background(RoundedHalfRectangle(width: UIScreen.main.bounds.width, height: 93, cornerRadius: 36, rotationDegree: 180, backgroundColor: Color.white, shadow: true).background(Color.clear))
            }
        }
    }
}

struct ServerTestView_Previews: PreviewProvider {
    static var previews: some View {
        ServerTestView()
    }
}
