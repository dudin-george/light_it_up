//
//  Event.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 03.03.2021.
//

import Foundation

struct Event: Identifiable {
    var id: Int
    var name: String
    var date: Date
    var dateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM"
        return dateFormatter.string(from: date)
    }
}
