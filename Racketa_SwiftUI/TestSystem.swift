//
//  TestSystem.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 07.04.2021.
//

import Foundation

class TestSystem {
    
    static let TestProject = Project(id: 0, name: "BioTerm", description: "Производство экологических емкостей и другие непонятные слова", imageName: "forTest", mainTag: "UI/UX and other", town: "Moscow")
    
    static let projectsTest = [
        Project(id: 0, name: "BioTerm 1", description: "Производство ", imageName: "forTest", mainTag: "UI/UX and other", town: "Moscow", news: [News(id: 0, name: "News 1", description: "This is first news", imageString: "forTest", text: "This is text for first news"), News(id: 1, name: "News 2", description: "This is first news", imageString: "forTest", text: "This is text for first news This is text for first news This is text for first news This is text for first news This is text for first news This is text for first news This is text for first news ")]),
                           Project(id: 1, name: "BioTerm 2", description: "Производство экологических емкостей и другие непонятные слова", imageName: "forTest", mainTag: "UI/UX and other", town: "Moscow"),
                           Project(id: 2, name: "BioTerm 3", description: "Производство экологических емкостей и другие непонятные слова", imageName: "forTest", mainTag: "UI/UX and other", events: [Event(id: 0, name: "Реорганизация файлов1", date: Date(timeIntervalSince1970: 14000)), Event(id: 1, name: "Реорганизация файлов2", date: Date(timeIntervalSince1970: 16000))], town: "Moscow"), Project(id: 2, name: "BioTerm 3", description: "Производство экологических емкостей и другие непонятные слова", imageName: "forTest", mainTag: "UI/UX and other", events: [Event(id: 0, name: "Реорганизация файлов1", date: Date(timeIntervalSince1970: 14000)), Event(id: 1, name: "Реорганизация файлов2", date: Date(timeIntervalSince1970: 16000))], town: "Moscow"),
        Project(id: 3, name: "BioTerm 4", description: "Производство экологических емкостей и другие непонятные слова", imageName: "forTest", mainTag: "UI/UX and other", events: [Event(id: 0, name: "Реорганизация файлов1", date: Date(timeIntervalSince1970: 14000)), Event(id: 1, name: "Реорганизация файлов2", date: Date(timeIntervalSince1970: 16000))], town: "Moscow"),
        Project(id: 4, name: "BioTerm 5", description: "Производство экологических емкостей и другие непонятные слова", imageName: "forTest", mainTag: "UI/UX and other", events: [Event(id: 0, name: "Реорганизация файлов1", date: Date(timeIntervalSince1970: 14000)), Event(id: 1, name: "Реорганизация файлов2", date: Date(timeIntervalSince1970: 16000))], town: "Moscow"),
        Project(id: 5, name: "BioTerm 6", description: "Производство экологических емкостей и другие непонятные слова", imageName: "forTest", mainTag: "UI/UX and other", events: [Event(id: 0, name: "Реорганизация файлов1", date: Date(timeIntervalSince1970: 14000)), Event(id: 1, name: "Реорганизация файлов2", date: Date(timeIntervalSince1970: 16000))], town: "Moscow")]
    
    static let eventsTest = [Event(id: 0, name: "Реорганизация файлов1", date: Date(timeIntervalSince1970: 14000)),
                         Event(id: 1, name: "Реорганизация файлов2", date: Date(timeIntervalSince1970: 16000))]
    
    static let newsTest = [News(id: 0, name: "News 1", description: "This is first news", imageString: "forTest", text: "This is text for first news"), News(id: 1, name: "News 2", description: "This is first news", imageString: "forTest", text: "This is text for first news"), News(id: 2, name: "News 3", description: "This is first news", imageString: "forTest", text: "This is text for first news"), News(id: 3, name: "News 4", description: "This is first news", imageString: "forTest", text: "This is text for first news")]
    
}
