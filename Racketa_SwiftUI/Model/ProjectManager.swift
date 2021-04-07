//
//  ProjectManager.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 24.02.2021.
//

import Foundation

struct ProjectManager {
    
    private(set) var projects: [Project] = []
    
    
    init(type: String) {
        projects = fetchProject(type: type)
    }
    
    func fetchProject(type: String) -> [Project] {
        let k = 7
        var projects: [Project] = []
        for i in 0..<k {
            var pr = TestSystem.TestProject
            pr.id = i
            projects.append(pr)
        }
        return projects
    }
    
}
