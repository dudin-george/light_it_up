//
//  Person.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 03.03.2021.
//

import Foundation

struct User: Hashable, Codable {
    var id: Int
    var phone: Int
    var name: String
    var surname: String
    var birthday: Date
    var country: String
    var city: String
    var profession: String
    var education: [String]
    var portfolio: [URL]
    var description: String
    var photos: String
    var tags: [String]
}
