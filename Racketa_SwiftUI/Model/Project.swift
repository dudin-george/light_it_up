//
//  Project.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 22.02.2021.
//

import Foundation

struct Project: Identifiable, Decodable {
    var id: Int
    var title: String
    var mainIdea: String
    var description: String
    var pictures: String
    var country: String
    var city: String
    var vacancies: [String]
    var tags: [String]
    var creationDate: Date
    
    var news: [News] = []
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case main_idea
        case description
        case pictures
        case country
        case city
        case vacancies
        case tags
        case creation_date
    }
    
    init(id: Int, title: String, mainIdea: String, description: String, pictures: String, country: String, city: String, vacancies: [String], tags: [String], creationDate: Date) {
        self.id = id
        self.title = title
        self.mainIdea = mainIdea
        self.description = description
        self.pictures = pictures
        self.country = country
        self.city = city
        self.vacancies = vacancies
        self.tags = tags
        self.creationDate = creationDate
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        mainIdea = try container.decode(String.self, forKey: .main_idea)
        description = try container.decode(String.self, forKey: .description)
        pictures = try container.decode(String.self, forKey: .pictures)
        country = try container.decode(String.self, forKey: .country)
        city = try container.decode(String.self, forKey: .city)
        vacancies = try container.decode([String].self, forKey: .vacancies)
        tags = try container.decode([String].self, forKey: .tags)
        creationDate = try container.decode(Date.self, forKey: .creation_date)
    }
}
