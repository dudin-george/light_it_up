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
    var portfolio: [String]
    var description: String
    var photos: String
    var tags: [String]
    
    var fullname: String {
        return "\(name) \(surname)"
    }
    
    var age: Int {
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: birthday, to: Date())
        return ageComponents.year!
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case phone
        case name
        case surname
        case birthday
        case country
        case city
        case profession
        case education
        case portfolio
        case description
        case photos
        case tags
    }
    
    init(id: Int, phone: Int, name: String, surname: String, birthday: Date, country: String, city: String,
         profession: String, education: [String], portfolio: [String],
         description: String, photos: String, tags: [String]) {
        
        self.id = id
        self.phone = phone
        self.name = name
        self.surname = surname
        self.birthday = birthday
        self.country = country
        self.city = city
        self.profession = profession
        self.education = education
        self.portfolio = portfolio
        self.description = description
        self.photos = photos
        self.tags = tags
        
    }
    
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        phone = try container.decode(Int.self, forKey: .phone)
        name = try container.decode(String.self, forKey: .name)
        surname = try container.decode(String.self, forKey: .surname)
        country = try container.decode(String.self, forKey: .country)
        city = try container.decode(String.self, forKey: .city)
        profession = try container.decode(String.self, forKey: .profession)
        education = try container.decode([String].self, forKey: .education)
        portfolio = try container.decode([String].self, forKey: .portfolio)
        description = try container.decode(String.self, forKey: .description)
        photos = try container.decode(String.self, forKey: .photos)
        tags = try container.decode([String].self, forKey: .tags)
        birthday = try container.decode(Date.self, forKey: .birthday)
    }
}
