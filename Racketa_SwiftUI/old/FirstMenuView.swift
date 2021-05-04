//
//  FirstMenuView.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 09.04.2021.
//

import SwiftUI

struct FirstMenuView: View {
    
    var title: String
    var description: String
    var isProject: Bool
    
    private let fontName: String = "Proxima Nova"
    
    var body: some View {
        ZStack {
            RoundedHalfRectangle(width: UIScreen.main.bounds.width, height: 230, cornerRadius: 20, rotationDegree: 0, backgroundColor: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), shadow: false)
                .shadow(color: Color(#colorLiteral(red: 0.9167665993, green: 0.9167665993, blue: 0.9167665993, alpha: 1)), radius: 2, x: 2, y: 2)
            firstMenu()
        }
    }
    
    private func firstMenu() -> some View {
        VStack {
            HStack {
                Text(title)
                    .bold()
                    .font(Font.custom(fontName, size: 24))
                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                    .padding(.leading, 16)
                Spacer()
                if isProject {
                    Button(action: {
                        print("DEBUG: join")
                    }) {
                        Text("Присоединиться")
                            .bold()
                            .font(Font.custom(fontName, size: 14))
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    }
                    .frame(width: 160, height: 37)
                    .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                    .cornerRadius(10)
                }
            }
            .padding()
            HStack {
                Text(description)
                    .lineLimit(2)
                    .frame(height: 44)
                    .padding()
                    .font(Font.custom(fontName, size: 18))
                Spacer()
            }
            .padding(.leading, 16)
            HStack {
                Button(action: {
                    print("DEBUG: save")
                }) {
                    Text("Сохранить")
                        .bold()
                        .font(Font.custom(fontName, size: 18))
                        .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                }
                .frame(width: 118, height: 37)
                Spacer()
            }
            .padding()
        }
    }
    
}

//struct FirstMenuView_Previews: PreviewProvider {
//    static var previews: some View {
//        FirstMenuView()
//    }
//}
