//
//  GlobalNews.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 05.08.2021.
//

import Foundation
import SwiftUI

struct GlobalNews: Identifiable {
    var id: Int
    var title: String
    var description: String
    var tag: String
    var authorString: String
    var date: Date
    var color: Color
    
    init(id: Int, title: String, description: String, tag: String, authorString: String, date: Date, color: Color){
        self.id = id
        self.title = title
        self.description = description
        self.tag = tag
        self.authorString = authorString
        self.date = date
        self.color = color
    }
    
    var dateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM"
        return dateFormatter.string(from: date)
    }
    
}
