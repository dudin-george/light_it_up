//
//  TestSystem.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 07.04.2021.
//

import Foundation

class TestSystem {
    
    
    private var userSasha = User(id: 1, phone: 9876543211,
                                 name: "Саша", surname: "Ог", birthday: Date(timeIntervalSince1970: 100000000),
                                 country: "Russia", city: "Krasnodar", profession: "minecraft",
                                 education: ["краснодарская гимназия", "школа 25"], portfolio: [],
                                 description: "Я родился 24 апреля 2002 года", photos: "forTest", tags: ["C++", "C", "Py"])
    private var project = Project(id: 1, title: "Racketa", mainIdea: "projects app", description: "descr",
                                  pictures: "forTest", country: "russia", city: "42", vacancies: ["all"], tags: ["swift", "py"], creationDate: Date(timeIntervalSince1970: 100000000))
    var projectsTest: [Project] = []
    
    static var TestProject: Project = Project(id: 1, title: "Racketa_swiftUI", mainIdea: "projects app", description: "descr",
                                              pictures: "forTest", country: "russia", city: "42", vacancies: ["all"], tags: ["swift", "py"], creationDate: Date(timeIntervalSince1970: 100000000))
    
    init(k: Int) {
        for i in 0..<k {
            var pr = project
            pr.id = i
            projectsTest.append(pr)
        }
    }
    
}
