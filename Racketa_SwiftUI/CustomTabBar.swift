//
//  CustomTabBar.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 22.02.2021.
//

import SwiftUI

struct CustomTabBar: View {
    
    @Binding var selected: Int
    var titles: [String]
    var firstColor: Color
    var secondColor: Color
    
    var space: CGFloat = 12
    
    var body: some View {
        HStack {
            ForEach((0..<titles.count), id: \.self){ i in
                Button(action: {
                    self.selected = i
                }) {
                    Text(titles[i])
                        .bold()
                }
                .foregroundColor(self.selected == i ? firstColor : secondColor)
                if i < titles.count - 1 {
                    Spacer(minLength: space)
                }
            }
        }
        .font(Font.custom(DesignClass.fontName, size: 10))
        .padding(.bottom)
    }
    
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

