//
//  ProjectFeedManager.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 24.02.2021.
//

import Foundation

class ProjectFeedManager: ObservableObject {
    
    @Published private var model = ProjectManager(type: "Feed")
    
    var projects: [Project] {
        model.projects
    }
    
    func add(){
        //TEST
        //model.addProject()
    }
    
}
