//
//  MainView.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 22.02.2021.
//

import SwiftUI

struct MainView: View {
    
    @State var selected = 1
    private let viewsTitles = ["Лента", "Проекты", "Профиль"]
    private let viewsImages = ["feed", "raketa", "profile"]
    
    var body: some View {
        ZStack {
            
            if selected == 0 {
                NewsView()
            } else if selected == 1 {
                ProjectActionView()
            } else {
                Text("ThirdView")
            }
            
            VStack {
                Spacer()
                CustomTabBar(selected: $selected, titles: viewsTitles, imageStr: viewsImages, firstColor: .white, secondColor: .gray)
                    .padding()
                    .padding(.horizontal, 32)
                    .background(RoundedCorners(tl: 20, tr: 20, bl: 0, br: 0).foregroundColor(.black).ignoresSafeArea())
                        
            }
        }
    }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
