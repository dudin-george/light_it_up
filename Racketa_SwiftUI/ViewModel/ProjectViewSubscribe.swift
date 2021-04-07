//
//  ProjectView.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 22.02.2021.
//

import SwiftUI

struct ProjectViewSubscribe: View {
    
    let project: Project
    
    private let width = UIScreen.main.bounds.width - 20
    private let cornerRadius: CGFloat = 26
    private let height: CGFloat = 274
    private let bottomHieght: CGFloat = 98
    private let fontName: String = "Proxima Nova"
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(project.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: width, height: height - 1, alignment: .top)
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                .shadow(color: Color.init(#colorLiteral(red: 0.6990006345, green: 0.6990006345, blue: 0.6990006345, alpha: 0.5)), radius: 4, x: 0, y: 4)
                .padding(.bottom, 1)
            VStack {
                Spacer()
                ZStack(alignment: .bottom) {
                    RoundedHalfRectangle(
                        width: width, height: bottomHieght, cornerRadius: cornerRadius,
                        rotationDegree: 0, backgroundColor: .white)
                        .frame(width: width, height: bottomHieght, alignment: .bottom)
                    HStack(alignment: .top, spacing: 15) {
                        VStack(alignment: .leading, spacing: 6){
                            Text(project.name)
                                .font(Font.custom("ProximaNova-Extrabld", size: 24))
                                .lineLimit(2)
                                .padding(.top, 11)
                            Text(project.description)
                                .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                                .font(Font.custom(fontName, size: 14))
                                .lineLimit(2)
                        }
                        .frame(height: bottomHieght, alignment: .top)
                        .padding(.leading, 15)
                        Spacer()
                        Button(action: {
                            print("This project id is - ", project.id)
                        }) {
                            Text("Открыть")
                                .bold()
                                .font(Font.custom(fontName, size: 14))
                                .frame(width: 89, height: 37, alignment: .center)
                        }
                        .background(Color.black)
                        .foregroundColor(Color.white)
                        .cornerRadius(19)
                        .padding(.top, 16)
                        .padding(.trailing, 13)
                    }
                    .frame(width: width, height: bottomHieght, alignment: .bottom)
                }
            }
            .frame(width: width, height: height, alignment: .bottom)
        }
    }
}



struct ProjectView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectViewSubscribe(project: TestSystem.TestProject)
    }
}
