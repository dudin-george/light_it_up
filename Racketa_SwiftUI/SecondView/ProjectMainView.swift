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
    @State private var angle:CGFloat = 0
    @State private var dW: CGFloat = 0
    
    
    var body: some View {
        VStack {
            ZStack {
                ProjectViewModel()
                    .frame(width: width - 56, height: height - 285)
                    .padding(.top)
                projectView()
            }
            
            Spacer()
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
                    Image("share")
                        .resizable()
                        .frame(width: 27, height: 27)

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
        }
        .padding(.bottom, 127)
    }
    
    private func projectView() -> some View {
        return ProjectViewModel()
                .frame(width: width - 56, height: height - 285)
                .animation(.easeIn)
                .padding(.top)
                .rotationEffect(Angle(radians: Double(angle)))
                .offset(x: dW, y: abs(2*R*sin(angle)*sin(angle)))
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            
                            self.dW = value.translation.width
                            self.angle = asin(self.dW/self.R)/2
                        })
                        .onEnded({ value in
                            withAnimation(.easeOut(duration: 0.1), {
                                self.dW = 0
                                self.angle = 0
                            })
                        })
                )
    }
}

struct ProjectMainView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectMainView()
    }
}
