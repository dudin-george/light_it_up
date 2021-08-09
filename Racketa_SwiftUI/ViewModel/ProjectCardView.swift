//
//  ProjectCardView.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 06.08.2021.
//

import SwiftUI

struct ProjectCardView: View {
    
    
    var project: Project
    
    @Binding var subscribeOpacity: Double
    @Binding var bookmarkOpacity: Double
    
    @State private var subscribe: Bool = false
    @State private var bookmark: Bool = false
    
    
    @State private var color = false
    
    private let imageAspectRation: CGFloat = 200/540
    
    
    var body: some View {
        GeometryReader { geometry in
            
            let width = geometry.size.width
            let height = geometry.size.height
            
            VStack(spacing: 0) {
                
                Image("forTest")
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: height*imageAspectRation, alignment: .top)
                    .clipShape(Rectangle())
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(project.title)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        
                        Image("subscriptions")
                            .colorMultiply(subscribe ? .black : Color(#colorLiteral(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)))
                            .foregroundColor(Color.white)
                            .onTapGesture {
                                if subscribe == false {
                                    withAnimation(.easeOut(duration: 0.2), {
                                        subscribeOpacity = 1
                                    })
                                }
                                withAnimation(.easeInOut(duration: 0.01), {
                                    subscribe = !subscribe
                                })
                            }
                            .padding(.horizontal)
                        
                        Image("bookmark")
                            .foregroundColor(.white)
                            .colorMultiply(bookmark ? .black : Color(#colorLiteral(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)))
                            .onTapGesture {
                                if bookmark == false {
                                    withAnimation(.easeOut(duration: 0.2), {
                                        bookmarkOpacity = 1
                                    })
                                }
                                withAnimation(.easeInOut(duration: 2)) {
                                    bookmark.toggle()
                                }
                            }
                        //-----
                        Image("bookmark")
                            .foregroundColor(.white)
                            .colorMultiply(color ? .red : .blue)
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 2)) {
                                    color.toggle()
                                }
                        }
                        //-----
                    }
                    
                    Text(project.mainIdea)
                        .font(.body)
                        .padding(.vertical)
                    
                    if project.vacancies.isEmpty == false {
                        Text("Нам нужен")
                            .foregroundColor(Color(#colorLiteral(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)))
                            .font(.headline)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach((0..<project.vacancies.count), content: { i in
                                        CustomButtonTag(title: project.vacancies[i], colorBorder: Color.black, padding: 10, colorTitle: Color.black)
                                            .padding(.vertical)
                                            .padding(.horizontal, 2)
                                    })
                                }
                            }
                    }
                    
                    if project.news.isEmpty == false {
                        Text("Последняя новость")
                            .foregroundColor(Color(#colorLiteral(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)))
                            .font(.headline)
                        Text(project.news[0].title)
                            .foregroundColor(Color(#colorLiteral(red: 0.5019607843, green: 0.5019607843, blue: 0.5019607843, alpha: 1)))
                            .padding(.vertical)
                        Text(project.news[0].description)
                            .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3)))
                    }
                    
                    Spacer()
                }
                .padding()
                .frame(height: height*(1 - imageAspectRation))
                .background(Color.white)
            }
        }
    }
}
