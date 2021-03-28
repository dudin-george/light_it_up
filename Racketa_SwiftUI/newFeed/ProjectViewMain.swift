//
//  ProjectViewMain.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 28.03.2021.
//

import SwiftUI

struct ProjectViewMain: View {
    @Binding var showView: Bool
    @State private var offsetY: CGFloat = 0
    
    private let width = UIScreen.main.bounds.width
    private let height: CGFloat = 247
    private let fontName: String = "Proxima Nova"
    private let cornerRadius: CGFloat = 26
    
    var project: Project
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack() {
                Image("forTest")
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: height, alignment: .top)
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                Spacer()
            }
            .offset(y: offsetY)
            .animation(Animation.easeInOut(duration: 0.4))

            VStack {
                ScrollView {
                    setText(title: project.name, lead: 16, space: 29)
                        .padding(.top, 32)
                }
            }
            .frame(width: width, height: UIScreen.main.bounds.height - height + 30)
            .background(Color.init(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
            .offset(y: offsetY)
            .animation(Animation.easeInOut(duration: 0.4))

        }
        .ignoresSafeArea()
        .gesture(
            DragGesture()
                .onChanged({ value in
                    self.offsetY = value.translation.height > 0 ? value.translation.height : 0
                    showView = self.offsetY <= 150
                })
                .onEnded({ value in
                    withAnimation {
                        self.offsetY = 0
                    }
                })
        )    }
    
    private func setText(title: String,
                         lead: CGFloat, space: CGFloat) -> some View{
        HStack {
            Text(title)
                .bold()
                .font(Font.custom(fontName, size: 24))
                .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
            Spacer()
        }
        .padding(.leading, lead)
        .padding(.bottom, space)
    }
}

//struct ProjectViewMain_Previews: PreviewProvider {
//    static var previews: some View {
//        let testProject = Project(id: 0, name: "BioTerm", description: "Производство экологических емкостей и другие непонятные слова", imageName: "forTest")
//        //ProjectViewMain(project: testProject)
//    }
//}

//        Image("forTest")
//            .gesture(
//                DragGesture()
//                    .onChanged({
//                        value in
//                        print(value.translation.height)
//                        //showView = value.translation.height > 100
//                    })
//                    .onEnded({ value in
//                        print(value.translation.height)
//                        showView = value.translation.height > 30
//                    })
//            )
