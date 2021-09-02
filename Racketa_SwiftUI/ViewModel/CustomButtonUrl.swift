//
//  CustomButtonUrl.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 11.08.2021.
//

import SwiftUI

struct CustomButtonUrl: View {
    
    var title: String
    var colorBorder: Color
    var padding: CGFloat
    var colorTitle: Color
    var url: URL
    
    var body: some View {
        Button(action: {
            print("tag printing \(url)")
        }) {
            HStack {
                Text(title)
                    .foregroundColor(colorTitle)
                Image("arrow")
            }
            .padding(padding)
            .overlay(
                Capsule(style: .continuous)
                    .stroke(colorBorder, lineWidth: 2)
            )
        }
    }
}
