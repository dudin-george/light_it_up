//
//  MainView.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 22.02.2021.
//

import SwiftUI

struct MainView: View {
    
    @State var selected = 1
    
    
    var body: some View {
        ZStack {
            
            if selected == 0 {
                Text("FirstView")
            } else if selected == 1 {
                ProjectMainView()
            } else {
                Text("ThirdView")
            }
            
            VStack {
                Spacer()
                CustomTabBar.init(selected: self.$selected)
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
