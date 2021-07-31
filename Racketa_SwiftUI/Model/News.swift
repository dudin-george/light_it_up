//
//  News.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 09.04.2021.
//

import Foundation
import UIKit

struct News: Identifiable, Decodable {
    var id: Int
    var title: String
    var description: String
    var imageURL: String
    var creationDate: Date = Date()
    var project: Int
    var author: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case pictures
        case project
        case author
        case creation_date
    }
    
    init(id: Int, title: String, description: String, project: Int, author: Int, imageURL: String) {
        self.id = id
        self.title = title
        self.description = description
        self.project = project
        self.author = author
        self.imageURL = imageURL
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        description = try container.decode(String.self, forKey: .description)
        imageURL = try container.decode(String.self, forKey: .pictures)
        project = try container.decode(Int.self, forKey: .project)
        author = try container.decode(Int.self, forKey: .author)
        creationDate = try container.decode(Date.self, forKey: .creation_date)
    }
}

//struct SomeImage: Codable {
//    let photo: Data
//
//    init(photo: UIImage) {
//        self.photo = photo.pngData()!
//    }
//}
