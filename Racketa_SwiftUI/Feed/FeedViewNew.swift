//
//  FeedViewNew.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 07.04.2021.
//

import SwiftUI

struct FeedViewNew: View {
    
    
    @State var selectedView = 1
    
    let fontName: String = "Proxima Nova"
    let width: CGFloat = UIScreen.main.bounds.width - 100
    
    var body: some View {
            if selectedView == 0 {
                VStack() {
                    setTopController()
                        .padding(.top, 64)
                        .padding(.bottom, 10)
                    FeedSubscribeView()
                }
                .ignoresSafeArea()
            } else {
                ZStack(alignment: .top){
                    setTopController()
                        .padding(.top, 64)
                    FeedInterestingView()
                }
                .ignoresSafeArea()
            }
    }
    
    private func setTopController() -> some View {
        HStack(spacing: 34) {
            Button(action: {
                self.selectedView = 0
            }) {
                Text("Подписки")
                    .bold()
                    .font(Font.custom(fontName, size: 18))
                    
            }.foregroundColor(self.selectedView == 0 ? .black : .gray)

            
            Button(action: {
                self.selectedView = 1
            }) {
                Text("Интересное")
                    .bold()
                    .font(Font.custom(fontName, size: 18))
                
            }
            .foregroundColor(self.selectedView == 1 ? .black : .gray)
        }
        .frame(width: width, height: 41)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.init(#colorLiteral(red: 0.1254901961, green: 0.2666666667, blue: 0.5333333333, alpha: 0.15)), radius: 20, x: 2, y: 2)
        
    }
}

struct FeedViewNew_Previews: PreviewProvider {
    static var previews: some View {
        FeedViewNew()
    }
}
