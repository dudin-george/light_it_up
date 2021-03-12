//
//  Person.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 03.03.2021.
//

import Foundation

struct Person: Hashable {
    var id: Int
    var firstName: String
    var lastName: String
    var fullName: String {
        firstName + lastName
    }
}
