//
//  MainView.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 22.02.2021.
//

import SwiftUI

struct MainView: View {
    
    @State var selected = 0
    
    var body: some View {
        VStack {
            if selected == 0 {
                FeedView()
            } else if selected == 1 {
                Text("SecondView")
            } else {
                Text("ThirdView")
            }
            Spacer()
            CustomTabBar.init(selected: self.$selected)
                .padding()
                .padding(.horizontal, 32)
                .background(RoundedHalfRectangle(width: UIScreen.main.bounds.width, height: 94, cornerRadius: 30, rotationDegree: 180, backgroundColor: Color.black))
        }
    }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
