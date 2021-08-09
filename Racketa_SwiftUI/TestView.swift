//
//  TestView.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 09.08.2021.
//

import SwiftUI

struct AnimateDemo: View {
    @State private var color = false

    var body: some View {
        //---
        Image("bookmark")
            .foregroundColor(.white)
            .colorMultiply(color ? .black : Color(#colorLiteral(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)))
            .onTapGesture {
                withAnimation(.easeInOut(duration: 2)) {
                    color.toggle()
                }
        }
        //----
    }
}

struct AnimateDemo_Previews: PreviewProvider {
    static var previews: some View {
        AnimateDemo()
    }
}
