//
//  ProjectView.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 22.02.2021.
//

import SwiftUI
import UIKit
struct ProjectViewInteresting: View {
    
    let project: Project
    
    private let width = UIScreen.main.bounds.width - 75
    private let cornerRadius: CGFloat = 26
    
    
    private let imageHeight: CGFloat = 194
    private let fontName: String = "Proxima Nova"
    private let corner: CGFloat = 10
    private let buttonSize: CGSize = CGSize(width: 118, height: 37)
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                VStack {
                    Image(project.pictures)
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: imageHeight, alignment: .top)
                        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                        .padding(.bottom, 1)
                    Spacer()
                }
                VStack {
                    ZStack(alignment: .bottom) {
                        RoundedHalfRectangle(
                            width: width, height: geometry.size.height - imageHeight + 20, cornerRadius: cornerRadius,
                            rotationDegree: 0, backgroundColor: .white, shadow: true)
                            .frame(height: geometry.size.height - imageHeight + 20, alignment: .bottom)
                        VStack(alignment: .leading, spacing: 6) {
                            Text(project.title)
                                .font(Font.custom("ProximaNova-Extrabld", size: 24))
                                .lineLimit(2)
                                .padding(.top, 11)
                            
                            Text(project.description)
                                .font(Font.custom(fontName, size: 18))
                                .padding(.trailing, 7)
                                .lineLimit(2)
                            
                            stateControll()
                            //TODO: разные виджеты/меню
                            Spacer()
                            
                            HStack() {
                                Text(project.city)
                                    .font(Font.custom(fontName, size: 14))
                                    .bold()
                                    .frame(width: buttonSize.width, height: buttonSize.height)
                                    .background(Color.white)
                                    .cornerRadius(corner)
                                    .shadow(color: Color.init(#colorLiteral(red: 0.9167665993, green: 0.9167665993, blue: 0.9167665993, alpha: 1)), radius: 10, x: 2, y: 2)
                            }
                            .padding(.bottom, 15)
                        }
                        .frame(height: geometry.size.height - imageHeight, alignment: .top)
                        .padding(.horizontal, 15)
                    }
                }
            }
            .frame(width: width, height: geometry.size.height, alignment: .bottom)
        }
    }
    
    private func stateControll() -> some View {
        HStack() {
            Button(action: {
                print("DEBUG: save")
            }) {
                HStack {
                    //TODO: bookmark
                    Spacer()
                    Text("Сохранено")
                        .font(Font.custom(fontName, size: 14))
                        .bold()
                        .foregroundColor(.white)
                        .padding(.trailing, 9)
                }
                .frame(width: buttonSize.width, height: buttonSize.height)
            }
            .background(Color.black)
            .cornerRadius(corner)
            
            Spacer()
            
            Button(action: {
                print("DEBUG: like")
            }) {
                Image("like_0")
                    .resizable()
                    .frame(width: 18, height: 18)
            }
            .frame(width: 37, height: 37)
            .background(Color.white)
            .cornerRadius(corner)
            .shadow(color: Color.init(#colorLiteral(red: 0.9167665993, green: 0.9167665993, blue: 0.9167665993, alpha: 1)), radius: 10, x: 2, y: 2)
            
            Button(action: {
                print("DEBUG: dislike")
            }) {
                Image("like_0")
                    .resizable()
                    .frame(width: 18, height: 18)
                    .rotationEffect(.init(degrees: 180))
            }
            .frame(width: 37, height: 37)
            .background(Color.white)
            .cornerRadius(corner)
            .shadow(color: Color.init(#colorLiteral(red: 0.9167665993, green: 0.9167665993, blue: 0.9167665993, alpha: 1)), radius: 10, x: 2, y: 2)
        }
        .padding(.top, 11)
    }
}



struct ProjectViewInteresting_Previews: PreviewProvider {
    static var previews: some View {
        ProjectViewInteresting(project: TestSystem.TestProject)
    }
}
