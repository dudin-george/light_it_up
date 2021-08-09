//
//  ProjectActionView.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 07.08.2021.
//

import SwiftUI

struct ProjectActionView: View {
    
    @State var viewSelected: Int = 1
    
    var body: some View {
        ZStack {
            
            if viewSelected == 1 {
                ProjectTinder()
            }
            
            VStack {
                CustomTabBar(selected: $viewSelected, titles: ["", "Проекты", ""], imageStr: ["search", "", "tags"], firstColor: .white, secondColor: .gray, fontSize: 24)
                    .padding()
                    .padding(.horizontal, 32)
                    .background(RoundedCorners(tl: 0, tr: 0, bl: 20, br: 20).foregroundColor(.black).ignoresSafeArea())
                Spacer()
            }
        }
    }
}

struct ProjectActionView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectActionView()
    }
}
