//
//  PosterImage.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 31.07.2021.
//

import SwiftUI

struct PosterImage: View {
    
    @ObservedObject var imageLoader: ImageLoader
    
    @State private var animate = false
    
    
    var body: some View {
        ZStack {
            if self.imageLoader.image != nil {
                Image(uiImage: self.imageLoader.image!)
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: 100, height: 100)
            } else {
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(width: 100, height: 100)
                    .overlay(
                        Text(imageLoader.url != nil ? "Loading..." : "")
                            .font(.footnote)
                            .foregroundColor(.white)
                            .rotationEffect(Angle(degrees: animate ? 60 : -60))
                            .onAppear {
                                withAnimation(Animation.easeInOut(duration: 1.0).repeatForever()) {
                                    self.animate = true
                                }
                        }
                    )
            }
        }
    }
}
