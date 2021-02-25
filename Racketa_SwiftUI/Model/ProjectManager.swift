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
        var projects: [Project] = []
        for i in 0..<5 {
            projects.append(Project(id: i, name: "BioTerm", description: "Производство экологических емкостей и другие непонятные слова", imageName: "forTest"))
        }
        return projects
    }

    //TEST
//    mutating func addProject(){
//        projects.append(Project(id: 10, name: "BioTerm", description: "Производство экологических емкостей и другие непонятные слова", imageName: "forTest"))
//    }
}
