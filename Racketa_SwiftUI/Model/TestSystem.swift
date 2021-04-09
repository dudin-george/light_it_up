//
//  TestSystem.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 07.04.2021.
//

import Foundation

class TestSystem {
    
    static let TestProject = Project(id: 0, name: "BioTerm", description: "Производство экологических емкостей и другие непонятные слова", imageName: "forTest", mainTag: "UI/UX and other", town: "Moscow")
    
    static let projects = [Project(id: 0, name: "BioTerm", description: "Производство экологических емкостей и другие непонятные слова", imageName: "forTest", mainTag: "UI/UX and other", town: "Moscow"), Project(id: 1, name: "BioTerm2", description: "Производство экологических емкостей и другие непонятные слова", imageName: "forTest", mainTag: "UI/UX and other", town: "Moscow"), Project(id: 2, name: "BioTerm3", description: "Производство экологических емкостей и другие непонятные слова", imageName: "forTest", mainTag: "UI/UX and other", town: "Moscow")]
    
    static let events = [Event(id: 0, name: "Реорганизация файлов1", date: Date(timeIntervalSince1970: 14000)),
                         Event(id: 1, name: "Реорганизация файлов2", date: Date(timeIntervalSince1970: 16000))]
}
