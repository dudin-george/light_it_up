//
//  ProjectViewMain.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 28.03.2021.
//

import SwiftUI

struct ProjectViewMain: View {
    
    //@State var showView: Bool = true
    @Binding var showView: Bool
    @State private var offsetY: CGFloat = 0
    
    var isProject: Bool
    
    private let width = UIScreen.main.bounds.width
    private let height: CGFloat = 247
    private let fontName: String = "Proxima Nova"
    private let cornerRadius: CGFloat = 26
    
    var project: Project?
    var events: [Event] {
        if project != nil {
            return project!.events
        }
        return []
    }
    
    var news: [News] {
        if project != nil {
            return project!.news
        }
        return []
    }
    
    var newsItem: News?
    
    var mainInfo: MainTextInfo {
        if project != nil {
            return project!.mainInfo
        } else {
            return newsItem!.mainInfo
        }
    }
    
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
                if isProject {
                    setProjectScroll()
                } else {
                    setNewsScroll()
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
        )
    }
    
    private func setProjectScroll() -> some View {
        ScrollView {
            FirstMenuView(title: mainInfo.name, description: mainInfo.description, isProject: isProject)
            secondMenu()
                .padding()
                
            ForEach(news) { item in
                ProjectViewSubscribe(project: nil, newsItem: item)
                    .padding(.bottom, 10.5)
                    .padding(.horizontal, 8)
            }
            VStack {
                Spacer(minLength: 80)
            }
        }
    }
    
    private func setNewsScroll() -> some View {
        ScrollView {
            FirstMenuView(title: mainInfo.name, description: mainInfo.description, isProject: isProject)
            
            HStack {
                Text(newsItem!.text)
                    .padding()
                    .font(Font.custom(fontName, size: 16))
                Spacer()
            }
            .padding(.leading, 16)
            
            
            VStack {
                Spacer(minLength: 80)
            }
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


//struct ProjectViewMain_Previews: PreviewProvider {
//    static var previews: some View {
//        ProjectViewMain(project: TestSystem.TestProject, events: TestSystem.events, isProject: true)
//    }
//}
