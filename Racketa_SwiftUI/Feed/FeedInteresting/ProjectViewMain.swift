//
//  ProjectViewMain.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 28.03.2021.
//

import SwiftUI

struct ProjectViewMain: View {
    
    @State var showView: Bool = true
    //@Binding var showView: Bool
    @State private var offsetY: CGFloat = 0
    
    private let width = UIScreen.main.bounds.width
    private let height: CGFloat = 247
    private let fontName: String = "Proxima Nova"
    private let cornerRadius: CGFloat = 26
    
    var project: Project
    var events: [Event]
//    var news: [News]
//    потом изменю когда начну когда пойму как запросы делать на сервер и тп
    var news = TestSystem.projects
    
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
                setScroll()
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
        )
    }
    
    private func setText(title: String,
                         lead: CGFloat) -> some View{
        HStack {
            Text(title)
                .bold()
                .font(Font.custom(fontName, size: 24))
                .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
            Spacer()
        }
        .padding(.leading, lead)
    }
    
    private func setScroll() -> some View {
        ScrollView {
            ZStack {
                RoundedHalfRectangle(width: UIScreen.main.bounds.width, height: 230, cornerRadius: 20, rotationDegree: 0, backgroundColor: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), shadow: false)
                    .shadow(color: Color(#colorLiteral(red: 0.9167665993, green: 0.9167665993, blue: 0.9167665993, alpha: 1)), radius: 2, x: 2, y: 2)
                firstMenu()
            }
            secondMenu()
                .padding()
            
            ForEach(news) { item in
                ProjectViewSubscribe(project: item)
                    .padding(.bottom, 10.5)
                    .padding(.horizontal, 8)
            }
            VStack {
                Spacer(minLength: 80)
            }
        }
    }
    
    private func firstMenu() -> some View {
        VStack {
            HStack {
                setText(title: project.name, lead: 16)
                Spacer()
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
            .padding()
            Text(project.description)
                .lineLimit(2)
                .padding()
                .font(Font.custom(fontName, size: 18))
            
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
    
    private func secondMenu() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
                .shadow(color: Color(#colorLiteral(red: 0.9167665993, green: 0.9167665993, blue: 0.9167665993, alpha: 1)), radius: 10, x: 2, y: 2)
            
            VStack {
                HStack {
                    Text("События")
                        .bold()
                        .font(Font.custom(fontName, size: 14))
                    Spacer()
                }
                .padding(.leading)
                .padding(.top)
                
                ScrollView {
                    ForEach(events){ item in
                            HStack {
                                Text(item.dateString)
                                    .foregroundColor(.blue)
                                    .font(Font.custom(fontName, size: 14))
                                    .bold()
                                    .padding(.leading)
                                    .padding(.bottom)
                                Text(item.name)
                                    .font(Font.custom(fontName, size: 16))
                                    .bold()
                                    .padding(.leading)
                                    .padding(.bottom)
                            }
                            .frame(width: UIScreen.main.bounds.width - 40, alignment: .leading)
                    }
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width - 40, height: 128)
    }
}


struct ProjectViewMain_Previews: PreviewProvider {
    static var previews: some View {
        ProjectViewMain(project: TestSystem.TestProject, events: TestSystem.events)
    }
}
