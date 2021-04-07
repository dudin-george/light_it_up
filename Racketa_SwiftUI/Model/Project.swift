//
//  Project.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 22.02.2021.
//

import Foundation

struct Project: Identifiable {
    var id: Int
    var name: String
    var description: String
    var imageName: String
    var mainTag: String
    var tags: [String] = []
    var deadlines: [Date] = []
    var team: [Person: String] = [:]
    var events: [Event] = []
    var town: String
}
