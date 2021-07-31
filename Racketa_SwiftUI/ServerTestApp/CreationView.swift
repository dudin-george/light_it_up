//
//  CreationView.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 31.07.2021.
//

import SwiftUI

struct CreationView: View {
    
    @State var selected: Int = 0
    
    private let titles: [String] = ["Проекты", "Пользователи", "Новости"]
    var body: some View {
        VStack {
            Text("Здесь вы можете что-то создать и потестить")
            HStack {
                ForEach((0..<titles.count), id: \.self) { i in
                    Button(action: { selected = i }){
                        Text(titles[i])
                            .padding()
                            .accentColor(selected == i ? .blue : .gray)
                    }
                }
            }
            switch selected{
            case 0:
                ProjectCreationView()
            case 1:
                UserCreationView()
            default:
                NewsCreationView()
            }
            Spacer()
        }
    }
}

struct CreationView_Previews: PreviewProvider {
    static var previews: some View {
        CreationView()
    }
}
