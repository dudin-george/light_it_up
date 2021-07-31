//
//  ImageLoader.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 31.07.2021.
//

import UIKit
import Combine

class ImageLoader: ObservableObject {
    
    @Published var url: URL?
    
    @Published var image: UIImage?
    
    init(url: URL?) {
        self.url = url
        $url
            .flatMap { (path) -> AnyPublisher<UIImage?, Never> in
                self.fetchImage(for: url)
            }
            .assign(to: \.image, on: self)
            .store(in: &self.cancellableSet)
    }
    
    private var cancellableSet = Set<AnyCancellable>()
        
    private func fetchImage(for url: URL?) -> AnyPublisher <UIImage?, Never> {
        guard url != nil, image == nil else {
            return Just(nil).eraseToAnyPublisher()
        }
        return
            URLSession.shared.dataTaskPublisher(for: url!)
                .map { UIImage(data: $0.data) }
                .replaceError(with: nil)
                .receive(on: RunLoop.main)
                .eraseToAnyPublisher()
    }
        
    deinit {
        for cancell in cancellableSet {
            cancell.cancel()
        }
    }
}
