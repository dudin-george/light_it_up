//
//  DetailView.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 03.03.2021.
//

import SwiftUI

struct DetailView: View {
    
    var project: Project
    
    private let fontName: String = "Proxima Nova"
    private let leadingText: CGFloat = 21
    private let spaceMain: CGFloat = 16
    private let space: CGFloat = 2
    private let width: CGFloat = UIScreen.main.bounds.width - 40
    private let aspectRationWidth: CGFloat = 184/334
    
    var body: some View {
        VStack(spacing: 0) {
            
            setText(title: "События", lead: leadingText, space: space)

            HStack {
                Text(project.name)
                    .bold()
                    .font(Font.custom(fontName, size: 24))
                Spacer()
            }
            .padding(.leading, leadingText)
            .padding(.bottom, spaceMain)
            
            setText(title: "Описание", lead: leadingText, space: space)

            HStack {
                Text(project.description)
                    .font(Font.custom(fontName, size: 18))
                    .lineLimit(2)
                Spacer()
            }
            .padding(.leading, leadingText)
            .padding(.bottom, spaceMain + space)
            
            setText(title: "События", lead: leadingText, space: space)
            
            CalendarView()
                .frame(width: UIScreen.main.bounds.width - 22, height: 248)
                .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                .cornerRadius(26)
                .shadow(color: Color.init(#colorLiteral(red: 0.6990006345, green: 0.6990006345, blue: 0.6990006345, alpha: 0.5)), radius: 4, x: 0, y: 4)
            HStack {
                TeemView()
                    .frame(width: aspectRationWidth*width, height: 190)
                    .cornerRadius(20)
                    .shadow(color: Color.init(#colorLiteral(red: 0.6990006345, green: 0.6990006345, blue: 0.6990006345, alpha: 0.5)), radius: 4, x: 0, y: 3)
                Spacer()
                ToDoView()
                    .frame(width: width*(1 - aspectRationWidth), height: 190)
                    .cornerRadius(20)
                    .onTapGesture {
                        print("sss")
                    }
                    .shadow(color: Color.init(#colorLiteral(red: 0.6990006345, green: 0.6990006345, blue: 0.6990006345, alpha: 0.5)), radius: 4, x: 0, y: 3)
            }
            .padding(.top, 16)
            .padding(.horizontal, 22)
            .padding(.bottom, spaceMain)
            
            setText(title: "Теги", lead: leadingText, space: space)
            
        }
    }
    
    private func setText(title: String,
                         lead: CGFloat, space: CGFloat) -> some View{
        HStack {
            Text(title)
                .bold()
                .font(Font.custom(fontName, size: 18))
                .foregroundColor(Color(#colorLiteral(red: 0.8705882353, green: 0.8705882353, blue: 0.8705882353, alpha: 1)))
            Spacer()
        }
        .padding(.leading, lead)
        .padding(.bottom, space)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(project: Project(id: 0, name: "BioTerm", description: "Производство экологических емкостей и другие непонятные слова", imageName: "forTest"))
    }
}
