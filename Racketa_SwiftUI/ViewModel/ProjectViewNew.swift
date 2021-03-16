//
//  ProjectView.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 22.02.2021.
//

import SwiftUI
import UIKit
struct ProjectViewNew: View {
    
    let project: Project
    
    private let width = UIScreen.main.bounds.width - 75
    private let cornerRadius: CGFloat = 26
    private let height: CGFloat = UIScreen.main.bounds.height - 274
    private let imageHeight: CGFloat = 194
    private let fontName: String = "Proxima Nova"
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                Image(project.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: imageHeight, alignment: .top)
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                    .padding(.bottom, 1)
                Spacer()
            }
            //.frame(width: width, height: bottomHieght, alignment: .bottom)
            VStack {
                Spacer()
                ZStack(alignment: .bottom) {
                    RoundedHalfRectangle(
                        width: width, height: height - imageHeight + 20, cornerRadius: cornerRadius,
                        rotationDegree: 0, backgroundColor: .white, shadow: true)
                        .frame(height: height - imageHeight + 20, alignment: .bottom)
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
                        .frame(height: height - imageHeight, alignment: .top)
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
                    .frame(width: width, height: height - imageHeight, alignment: .bottom)
                }
            }
            .frame(width: width, height: height, alignment: .bottom)
        }
        .frame(width: width, height: height, alignment: .bottom)
    }
}



struct ProjectViewNew_Previews: PreviewProvider {
    static var previews: some View {
        let testProject = Project(id: 0, name: "BioTerm", description: "Производство экологических емкостей и другие непонятные слова", imageName: "forTest")
        ProjectViewNew(project: testProject)
    }
}
