//
//  ProjectManager.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 24.02.2021.
//

import Foundation
import Combine
class ProjectManager: ObservableObject {
    
    private let APIString: String = "http://89.223.122.31:8000/api/projects/"
    
    @Published private(set) var project: Project?
    
    func fetchProject(id: Int) {
        let url = URL(string: APIString + "\(id)/")!
        print(APIString + "\(id)/")
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap{
                (data, respons) in
                print("oh")
                print(String(data: data, encoding: .utf8)!)
                
                let decoder = JSONDecoder()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                decoder.dateDecodingStrategy = .formatted(dateFormatter)
                
                self.project = try! decoder.decode(Project.self, from: data)
            }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    func fetchProject() -> AnyPublisher<[Project], Never> {
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        let url = URL(string: "http://89.223.122.31:8000/api/projects/")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Project].self, decoder: decoder)
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
