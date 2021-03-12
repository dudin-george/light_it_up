//
//  TeemView.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 09.03.2021.
//

import SwiftUI

struct TeemView: View {
    
    var team: [Person: String] = [Person(id: 0, firstName: "Ася", lastName: "Кукота"):"Дизайнер", Person(id: 1, firstName: "Влад", lastName: "Кукота"): "Автор", Person(id: 2, firstName: "Дима", lastName: "Кукота"): "Разработчик"]
    var persons: [Person] {
        Array(team.keys)
    }
    private let fontName: String = "Proxima Nova"
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)).ignoresSafeArea()
                VStack(spacing: 4) {
                    HStack {
                        Text("Команда")
                            .font(Font.custom(fontName, size: 18))
                            .bold()
                            .padding(.horizontal, 15)
                        Spacer()
                    }
                    
                    if team.isEmpty {
                        HStack {
                            Text("Пока людей нет")
                                .font(Font.custom(fontName, size: 14))
                                .bold()
                                .padding(.horizontal, 15)
                            Spacer()
                        }
                    } else {
                        ScrollView {
                            ForEach(persons, id: \.id){ person in
                                VStack {
                                    HStack {
                                        Text(team[person]!)
                                            .font(Font.custom(fontName, size: 14))
                                            .bold()
                                        Spacer()
                                    }
                                    HStack {
                                        Text(person.fullName)
                                            .font(Font.custom(fontName, size: 14))
                                        Spacer()
                                    }
                                }
                                .padding(.horizontal, 15)
                                .padding(.bottom, 4)
                            }
                        }
                    }
                    Button(action: {
                        
                    }) {
                        Text("Добавить")
                            .font(Font.custom(fontName, size: 14))
                            .bold()
                    }
                    .frame(width: geometry.size.width - 10, height: 37)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.4666666667, green: 0.5843137255, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.2901960784, green: 0.4470588235, blue: 1, alpha: 1))]), startPoint: .leading, endPoint: .trailing))
                    .foregroundColor(.white)
                    .cornerRadius(19.5)
                }
                .padding(15)
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .top)
            }
        }
    }
}

struct TeemView_Previews: PreviewProvider {
    static var previews: some View {
        TeemView()
    }
}
