//
//  MyProjectFeedManager.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 03.03.2021.
//

import Foundation

class MyProjectFeedManager: ObservableObject {
    
    @Published private var model = ProjectManager(type: "MyProjectFeed")
    
    var projects: [Project] {
        model.projects
    }
    
    func add(){
        //TEST
        //model.addProject()
    }
    
}
