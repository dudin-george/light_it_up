//
//  ProjectFeedManager.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 24.02.2021.
//

import Foundation

class ProjectSubscribeManager: ObservableObject {
    
    @Published private var model = ProjectManager(type: "Subscribe")
    
    var projects: [Project] {
        model.projects
    }
    
}
