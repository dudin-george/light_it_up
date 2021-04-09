//
//  ToDoView.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 03.03.2021.
//

import SwiftUI

struct ToDoView: View {

    var events: [Event] = TestSystem.events
    
    private let fontName: String = "Proxima Nova"
    var width: CGFloat = 150
    var height: CGFloat = 193
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(#colorLiteral(red: 0.2901960784, green: 0.4470588235, blue: 1, alpha: 1)).ignoresSafeArea()
                VStack(spacing: 0) {
                    HStack {
                        Text("To Do")
                            .font(Font.custom(fontName, size: 18))
                            .foregroundColor(.white)
                            .bold()
                            .padding(.top, 16)
                            .padding(.bottom, 7)
                        Spacer()
                    }
                    
                    ScrollView {
                        ForEach(events, id: \.name){ item in
                            VStack {
                                HStack {
                                    Text(item.dateString)
                                        .foregroundColor(Color(#colorLiteral(red: 0.8705882353, green: 0.8705882353, blue: 0.8705882353, alpha: 1)))
                                        .font(Font.custom(fontName, size: 10))
                                        .bold()
                                    Spacer()
                                }
                                
                                HStack {
                                    Text(item.name)
                                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                        .font(Font.custom(fontName, size: 10))
                                        .bold()
                                    Spacer()
                                }
                            }
                            .padding(.bottom, 4)
                        }
                    }
                    .padding(.bottom, 15)
                }
                .padding(.horizontal, 15)
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .top)
            }
        }
    }
}

struct ToDoView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView()
    }
}
