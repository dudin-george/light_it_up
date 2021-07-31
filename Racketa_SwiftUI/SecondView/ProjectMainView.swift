//
//  ProjectMainView.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 04.05.2021.
//

import SwiftUI

struct ProjectMainView: View {
    
    private let width = UIScreen.main.bounds.size.width
    private let height = UIScreen.main.bounds.size.height
    
    private let R = 3.03*UIScreen.main.bounds.width
    
    private var projects = TestSystem(k: 10).projectsTest
    
    @State private var angle:CGFloat = 0
    @State private var dW: CGFloat = 0
    @State private var currentId: Int = 0
    
    var body: some View {
        VStack {
            if currentId == projects.endIndex {
                Text("Проекты закончились :(")
                    .frame(width: width - 56, height: height - 255)
                    .padding(.top)
            }
            ZStack {
                ForEach(0..<projects.count) { i in
                    if projects.count - i - 1 >= currentId {
                        projectView(project: projects[projects.count - i - 1])
                    }
                }
            }
            
            HStack(spacing: 50) {
                Button(action: {
                    print("DEBUG: share")
                }, label: {
                    Image("share")
                        .resizable()
                })
                .frame(width: 29, height: 29)
                
                Button(action: {
                    print("DEBUG: add")
                }, label: {
                    Image("plus")
                        .resizable()
                        .frame(width: 27, height: 27)
                        .foregroundColor(.black)

                })
                .frame(width: 73, height: 73)
                .background(Circle())
                .foregroundColor(.white)
                .shadow(color: Color(#colorLiteral(red: 0.9167665993, green: 0.9167665993, blue: 0.9167665993, alpha: 1)), radius: 2)
                
                Button(action: {
                    print("DEBUG: subscribe")
                }, label: {
                    Image("share")
                        .resizable()
                })
                .frame(width: 40, height: 25)
            }
            .padding(.bottom, 90)
            .padding(.top, 20)
        }
    }
    
    private func projectView(project: Project) -> some View {
        return ProjectViewModel(project: project)
                .frame(width: width - 56, height: height - 255)
                .animation(.easeIn)
                .padding(.top)
                .rotationEffect(Angle(radians: getAngle(pr: project)))
                .offset(x: getDW(pr: project), y: getDH(pr: project))
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            self.dW = value.translation.width
                            self.angle = asin(self.dW/self.R)/2
                        })
                        .onEnded({ value in
                            if abs(value.translation.width/width) > 0.5 {
                                withAnimation(.easeOut(duration: 0.2), {
                                    self.dW = value.translation.width/width*(width*1.9)
                                    self.angle = asin(self.dW/self.R)/2
                                })
                                withAnimation(.easeOut(duration: 0.2), {
                                    self.currentId += 1
                                    self.dW = 0
                                    self.angle = 0
                                })
                                if value.translation.width/width > 0 {
                                    print("DEBUG: like")
                                } else {
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
    
    private func getDW(pr: Project) -> CGFloat {
        return projects[currentId].id == pr.id ? dW : 0
    }
    
    private func getAngle(pr: Project) -> Double {
        return projects[currentId].id == pr.id ? Double(angle) : 0.0
    }
    
    private func getDH(pr: Project) -> CGFloat {
        return projects[currentId].id == pr.id ? abs(2*R*sin(angle)*sin(angle)) : 0
    }
}

struct ProjectMainView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectMainView()
    }
}
