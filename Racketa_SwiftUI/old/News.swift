//
//  News.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 09.04.2021.
//

import Foundation

struct News: Identifiable {
    var id: Int
    var name: String
    var description: String
    var imageString: String
    var mainInfo: MainTextInfo {
        return MainTextInfo(name: name, description: description, imageString: imageString)
    }
    var text: String
}
