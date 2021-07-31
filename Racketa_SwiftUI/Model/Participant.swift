//
//  Participant.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 25.07.2021.
//

import Foundation

struct Participant: Identifiable {
    var id: Int
    var admin: Bool
    var role: String
    var project: Project
    var user: User
}
