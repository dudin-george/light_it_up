//
//  RoundedHalfRectangle.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 22.02.2021.
//

import SwiftUI

struct RoundedHalfRectangle: View {
    var width: CGFloat
    var height: CGFloat
    var cornerRadius: CGFloat
    var rotationDegree: Double
    var backgroundColor: Color
    
    var body: some View {
        Path { path in
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: height))
            path.addArc(center: CGPoint(x: cornerRadius, y: height - cornerRadius), radius: cornerRadius, startAngle: .init(degrees: -180), endAngle: .init(degrees: -270), clockwise: true)
            path.addLine(to: CGPoint(x: width - cornerRadius, y: height))
            path.addArc(center: CGPoint(x: width - cornerRadius, y: height - cornerRadius), radius: cornerRadius, startAngle: .init(degrees: 90), endAngle: .init(degrees: 0), clockwise: true)
            path.addLine(to: CGPoint(x: width, y: 0))
                
        }.rotation(.init(degrees: rotationDegree))
        .fill(backgroundColor)
        .ignoresSafeArea()
    }
}
