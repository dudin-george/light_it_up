//
//  ProjectAPI.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 30.07.2021.
//

import Foundation
import Combine

enum Endpoint {
    static let baseURL = URL(string: "http://89.223.122.31:8000/api/")!
    
    case projects, news, users
    case project(Int), new(Int), user(Int)
    
    var url: URL {
        switch self {
        case .project(let id):
            return Endpoint.baseURL.appendingPathComponent("projects/\(id)/")
        case .projects:
            return Endpoint.baseURL.appendingPathComponent("projects/")
        case .news:
            return Endpoint.baseURL.appendingPathComponent("news/")
        case .new(let id):
            return Endpoint.baseURL.appendingPathComponent("news/\(id)/")
        case .users:
            return Endpoint.baseURL.appendingPathComponent("users/")
        case .user(let id):
            return Endpoint.baseURL.appendingPathComponent("users/\(id)/")
        }
    }
    
    init? (index: Int) {
        switch index {
            case 0: self = .projects
            case 1: self = .news
            case 2: self = .users
            default: return nil
        }
    }
}

class ProjectAPI {
    static let shared = ProjectAPI()
    
    func fetch<T: Decodable>(_ url: URL) -> AnyPublisher<T, Error> {
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: T.self, decoder: decoder)
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    func project(id: Int) -> AnyPublisher<Project, Never> {
        fetch(Endpoint.project(id).url)
            .catch { _ in Empty() }
            .eraseToAnyPublisher()
    }
    
    func projectNews(id: Int) -> AnyPublisher<[News], Never> {
        fetch(Endpoint.project(id).url.appendingPathComponent("news/"))
            .catch { _ in Empty() }
            .eraseToAnyPublisher()
    }
    
}
