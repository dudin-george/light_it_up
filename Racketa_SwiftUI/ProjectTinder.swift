//
//  ProjectTinder.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 06.08.2021.
//

import SwiftUI

struct ProjectTinder: View {
    private let standartPr = Project(id: 1, title: "Racketa app", mainIdea: "Поиск людей", description: "", pictures: "", country: "", city: "", vacancies: ["UI/UX", "swift", "py"], tags: [], creationDate: Date(timeIntervalSince1970: 100))
    
    private let R = 3.03 * UIScreen.main.bounds.width
    
    @State private var angle:CGFloat = 0
    @State private var dW: CGFloat = 0
    @State private var currentId: Int = 0
    
    @State private var subscribeOpacity: Double = 0
    @State private var bookmarkOpacity: Double = 0
    @State private var likeOpacity: Double = 0
    @State private var dislikeOpacity: Double = 0
    
    
    var body: some View {
        VStack {
            ZStack {
                Image("like")
                    .opacity(likeOpacity)
                    .onAnimationCompleted(for: likeOpacity) {
                        if likeOpacity > 0 {
                            withAnimation(.easeOut(duration: 0.5), {
                                likeOpacity = 0
                            })
                        }
                    }
                
                Image("dislike")
                    .opacity(dislikeOpacity)
                    .onAnimationCompleted(for: dislikeOpacity) {
                        if dislikeOpacity > 0 {
                            withAnimation(.easeOut(duration: 0.5), {
                                dislikeOpacity = 0
                            })
                        }
                    }
            }
            .frame(width: 30, height: 30)
            ZStack(alignment: Alignment.top) {
                ForEach((0..<2)) { i in
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: UIScreen.main.bounds.height*0.55)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2)), radius: 5, y: 4)
                        .padding(.horizontal)
                        .padding(.top, CGFloat((2 - i))*13)
                }
                projectView()
            }
            
            ZStack {
                Text("Вы подписались на обновления проекта")
                    .foregroundColor(.gray)
                    .opacity(subscribeOpacity)
                    .onAnimationCompleted(for: subscribeOpacity) {
                        if subscribeOpacity > 0 {
                            withAnimation(.easeOut(duration: 0.4), {
                                subscribeOpacity = 0
                            })
                        }
                    }
                
                Text("Вы сохранили проект")
                    .foregroundColor(.gray)
                    .opacity(bookmarkOpacity)
                    .onAnimationCompleted(for: bookmarkOpacity) {
                        if bookmarkOpacity > 0 {
                            withAnimation(.easeOut(duration: 0.4), {
                                bookmarkOpacity = 0
                            })
                        }
                    }
            }
        }
    }
    
    private func projectView() -> some View {
        return ProjectCardView(project: standartPr, subscribeOpacity: $subscribeOpacity, bookmarkOpacity: $bookmarkOpacity)
                .frame(maxWidth: .infinity)
                .frame(height: UIScreen.main.bounds.height*0.55)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2)), radius: 5, y: 4)
                .padding(.horizontal)
                .animation(.easeIn)
                .rotationEffect(Angle(radians: Double(angle)))
                .offset(x: dW, y: abs(2 * R * sin(angle) * sin(angle)))
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            self.dW = value.translation.width
                            self.angle = asin(self.dW / self.R) / 2
                        })
                        .onEnded({ value in
                            let width = UIScreen.main.bounds.size.width
                            let widthEnd = value.translation.width
                            
                            if abs(widthEnd / width) > 0.5 {
                                withAnimation(.easeOut(duration: 0.2), {
                                    self.dW = widthEnd * 1.9
                                    self.angle = asin(self.dW / self.R) / 2
                                })
                                withAnimation(.easeOut(duration: 0.2), {
                                    self.currentId += 1
                                    self.dW = 0
                                    self.angle = 0
                                })
                                if widthEnd > 0 {
                                    withAnimation(.easeOut(duration: 0.2), {
                                        likeOpacity = 1
                                    })
                                    print("DEBUG: like")
                                } else {
                                    withAnimation(.easeOut(duration: 0.2), {
                                        dislikeOpacity = 1
                                    })
                                    print("DEBUG: dislike")
                                }
                            } else {
                                withAnimation(.easeOut(duration: 0.1), {
                                    self.dW = 0
                                    self.angle = 0
                                })
                            }
                        })
                )
    }

}

struct ProjectTinder_Previews: PreviewProvider {
    static var previews: some View {
        ProjectTinder()
    }
}
