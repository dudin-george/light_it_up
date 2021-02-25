//
//  FeedView.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 22.02.2021.
//

import SwiftUI

struct FeedView: View {
    
    let fontName: String = "Proxima Nova"
    
    @ObservedObject var viewModel = ProjectFeedManager()
    @State var selectedView = 0
    
    var body: some View {
        VStack(spacing: 0){
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
                    
                }.foregroundColor(self.selectedView == 1 ? .black : .gray)
            }
            .padding(.top, 20)
            .padding(.bottom, 21)
            ScrollView {
                ForEach(viewModel.projects) { project in
                    ProjectView(project: project)
                        .padding(.bottom, 10.5)
                        .padding(.horizontal, 7)
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
