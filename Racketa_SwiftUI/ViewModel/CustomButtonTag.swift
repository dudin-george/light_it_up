//
//  CustomButtonTag.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 06.08.2021.
//

import SwiftUI

struct CustomButtonTag: View {
    
    var title: String
    var colorBorder: Color
    var padding: CGFloat
    var colorTitle: Color
    
    var body: some View {
        Button(action: {
            print("tag printing \(title)")
        }) {
            Text(title)
                .padding(padding)
                .foregroundColor(colorTitle)
                .overlay(
                    Capsule(style: .continuous)
                        .stroke(colorBorder, lineWidth: 2)
                )
        }
    }
}
