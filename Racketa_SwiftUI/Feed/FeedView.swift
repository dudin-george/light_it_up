//
//  FeedView.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 22.02.2021.
//

import SwiftUI

struct FeedView: View {
    
    @State var selectedView = 0
    
    var body: some View {
        VStack{
            HStack(spacing: 34) {
                Button(action: {
                    self.selectedView = 0
                }) {
                    Text("Подписки")
                        .bold()
                        .font(Font.system(size: 18))
                        
                }.foregroundColor(self.selectedView == 0 ? .black : .gray)
                
                Button(action: {
                    self.selectedView = 1
                }) {
                    Text("Интересное")
                        .bold()
                        .font(Font.system(size: 18))
                }.foregroundColor(self.selectedView == 1 ? .black : .gray)
            }
            ScrollView {
                ProjectView()
                    .padding(10)
                ProjectView()
                    .padding(10)
                ProjectView()
                    .padding(10)
                ProjectView()
                    .padding(10)
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
