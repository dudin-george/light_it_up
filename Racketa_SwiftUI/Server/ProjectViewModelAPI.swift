//
//  File.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 30.07.2021.
//

import Foundation
import Combine

class ProjectViewModelAPI: ObservableObject {
    
    private let api = ProjectAPI.shared
    //input
    @Published var idProject: Int = 0
    
    @Published var project: Project?
    
    
    init() {
        $idProject
            .flatMap { (idProject) -> AnyPublisher<Project, Never> in
                self.api.project(id: idProject)
            }
            .receive(on: RunLoop.main)
            .sink(receiveValue: { (pr) in
                self.project = pr
                self.api.projectNews(id: pr.id)
                    .sink { (news) in
                        self.project!.news = news
                    }
                    .store(in: &self.subscriptions)
                    
            })
            .store(in: &self.subscriptions)
    }
    
    private var subscriptions = Set<AnyCancellable>()
    
}
