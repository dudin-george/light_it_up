//
//  ProjectView.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 22.02.2021.
//

import SwiftUI

struct ProjectView: View {
    
    let project: Project = Project(name: "BioTerm", description: "Производство экологических емкостей и другие непонятные слова", imageName: "forTest")
    
    let width = UIScreen.main.bounds.width - 20
    let cornerRadius: CGFloat = 26
    
    var body: some View {
        ZStack {
            Image(project.imageName)
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                .shadow(color: .gray, radius: 2, x: 0, y: 2)
            
            VStack {
                Spacer()
                ZStack(alignment: .bottom) {
                    RoundedHalfRectangle(
                        width: width, height: 94, cornerRadius: cornerRadius,
                        rotationDegree: 0, backgroundColor: .white)
                    HStack {
                        VStack(alignment: .leading){
                            Text(project.name)
                                .bold()
                                .font(Font.system(size: 24))
                                .padding(.bottom, 7)
                            Text(project.description)
                                .foregroundColor(.gray)
                                .font(Font.system(size: 14))
                        }
                        .padding(.leading, 15)
                        Spacer()
                        Button(action: {
                            
                        }) {
                            Text("Открыть")
                                .bold()
                                .font(Font.system(size: 16))
                                .frame(width: 90, height: 37, alignment: .center)
                        }
                        .background(Color.black)
                        .foregroundColor(Color.white)
                        .cornerRadius(19)
                        .padding()
                    }
                    .padding(.bottom, 10)
                    
                }
                .frame(width: width, height: 94, alignment: .bottom)
            }
        } .frame(width: width, height: 274)
    }
}



struct ProjectView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectView()
    }
}
