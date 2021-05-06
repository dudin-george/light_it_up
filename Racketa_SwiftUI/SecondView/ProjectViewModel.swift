//
//  ProjectViewModel.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 04.05.2021.
//

import SwiftUI

struct ProjectViewModel: View {
    
    private let cornerRadius: CGFloat = 26
    var project = TestSystem.TestProject
    private let fontName: String = "Proxima Nova"
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                VStack {
                    ZStack(alignment: .leading) {
                        image(width: geometry.size.width, height: geometry.size.height*0.35)
                        HStack(alignment: .bottom){
                            VStack(alignment: .leading) {
                                Spacer()
                                Text(project.description)
                                    .lineLimit(3)
                                    .font(Font.custom("ProximaNova-Extrabld", size: 18))
                                    .foregroundColor(.white)
                                    .padding(.bottom, 20)
                                HStack(spacing: 20) {
                                    tagLabel(text: "oho this is tag")
                                    tagLabel(text: "oho this is tag 2")
                                }
                                .padding(.bottom, 20)
                            }
                            .padding()
                        }
                        .frame(height: geometry.size.height*0.35)
                        .padding(.trailing, 40)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height*0.35)
                    Spacer()
                }
                
                VStack {
                    Spacer()
                    ZStack(alignment: .bottom) {
                        RoundedHalfRectangle(
                            width: geometry.size.width, height: geometry.size.height*0.65 + 26, cornerRadius: cornerRadius, rotationDegree: 0, backgroundColor: .white)
                            .frame(width: geometry.size.width, height: geometry.size.height*0.65 + 26)
                            .shadow(color: Color.init(#colorLiteral(red: 0.6990006345, green: 0.6990006345, blue: 0.6990006345, alpha: 0.5)), radius: 2, x: 0, y: 1)
                        HStack(alignment: .bottom) {
                            VStack(alignment: .leading) {
                                Text(project.name)
                                    .font(Font.custom("ProximaNova-Extrabld", size: 24))
                                Spacer()
                            }
                            .padding()
                            Spacer()
                        }
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height*0.65 + 26)
                }
            }
        }
    }
    
    private func image(width: CGFloat, height: CGFloat) -> some View {
        return Image("forTest")
            .resizable()
            .scaledToFill()
            .frame(width: width, height: height, alignment: .top)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .shadow(color: Color.init(#colorLiteral(red: 0.6990006345, green: 0.6990006345, blue: 0.6990006345, alpha: 0.5)), radius: 4, x: 0, y: 4)
    }
    
    private func tagLabel(text: String) -> some View {
        return ZStack {
            Text(text)
                .font(Font.custom("ProximaNova-Extrabld", size: 14))
                .foregroundColor(.white)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(RoundedRectangle(cornerRadius: 19.5)
                                .foregroundColor(.white)
                                .opacity(0.4)
                                )
                .overlay(RoundedRectangle(cornerRadius: 19.5)
                            .stroke(Color.white, lineWidth: 2))
        }
    }
}

struct ProjectViewModel_Previews: PreviewProvider {
    static var previews: some View {
        ProjectViewModel()
    }
}
