//
//  CustomTabBar.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 22.02.2021.
//

import SwiftUI

struct CustomTabBar: View {
    
    let fontName: String = "Proxima Nova"
    
    @Binding var selected: Int
    
    var body: some View {
        HStack {
            Button(action: {
                self.selected = 0
            }) {
                Text("Лента")
                    .bold()
            }.foregroundColor(self.selected == 0 ? .blue : .gray)
            
            Spacer(minLength: 12)
            
            Button(action: {
                self.selected = 1
            }) {
                Text("Проекты")
                    .bold()
            }.foregroundColor(self.selected == 1 ? .blue : .gray)
            
            Spacer(minLength: 12)
            
            Button(action: {
                self.selected = 2
            }) {
                Text("Профиль")
                    .bold()
            }
            .foregroundColor(self.selected == 2 ? .blue : .gray)
        }
        .font(Font.custom(fontName, size: 10))
        .padding(.bottom)
    }
    
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

