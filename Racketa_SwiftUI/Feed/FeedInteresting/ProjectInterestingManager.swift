//
//  ProjectInterestingManager.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 07.04.2021.
//

import Foundation

class ProjectInterestingManager: ObservableObject {
    
    @Published private var model = ProjectManager(type: "Interesting")
    
    var projects: [Project] {
        model.projects
    }
    
}


