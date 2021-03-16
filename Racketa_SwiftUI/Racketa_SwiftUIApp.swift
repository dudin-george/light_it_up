//
//  Racketa_SwiftUIApp.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 18.02.2021.
//

import SwiftUI

@main
struct Racketa_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            //MainView()
            //DetailView(project: Project(id: 0, name: "BioTerm", description: "Производство экологических емкостей и другие непонятные слова", imageName: "forTest"))
            FeedSwipeView()
        }
    }
}
