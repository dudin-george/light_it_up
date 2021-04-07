//
//  MyProjectFeedView.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 03.03.2021.
//

import SwiftUI

struct MyProjectFeedView: View {
    
    @ObservedObject var viewModel = MyProjectFeedManager()
    
    let fontName: String = "Proxima Nova"
    
    var body: some View {
        VStack(spacing: 0){
            HStack {
                Text("Мои проекты")
                    .bold()
                    .font(Font.custom(fontName, size: 24))
                    .frame(width: 157, height: 29)
                    .padding(.leading, 21)
                Spacer()
            }
            .padding(.top, 7)
            .padding(.bottom, 21)
            
            Button(action: {
                print("DEBUG: Add project")
            }) {
                Text("Новый проект")
                    .font(Font.custom(fontName, size: 14))
                    .bold()
            }
            .frame(width: UIScreen.main.bounds.width - 100, height: 37)
            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.4666666667, green: 0.5843137255, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.2901960784, green: 0.4470588235, blue: 1, alpha: 1))]), startPoint: .leading, endPoint: .trailing))
            .foregroundColor(.white)
            .cornerRadius(19.5)
            
            ScrollView {
                ForEach(viewModel.projects) { project in
                    ProjectViewSubscribe(project: project)
                        .padding(.bottom, 10.5)
                        .padding(.horizontal, 7)
                }
            }
            .padding(.top, 31)
        }
    }
}

struct MyProjectFeedView_Previews: PreviewProvider {
    static var previews: some View {
        MyProjectFeedView()
    }
}
