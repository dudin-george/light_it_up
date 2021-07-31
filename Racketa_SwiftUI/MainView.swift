//
//  MainView.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 22.02.2021.
//

import SwiftUI

struct MainView: View {
    
    @State var selected = 0
    private let viewsTitles = ["Лента", "Проекты", "Профиль"]
    
    var body: some View {
        ZStack {
            
            if selected == 0 {
                FeedProject()
            } else if selected == 1 {
                ProjectMainView()
            } else {
                Text("ThirdView")
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

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
