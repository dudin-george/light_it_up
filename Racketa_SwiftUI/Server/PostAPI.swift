//
//  PostAPI.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 31.07.2021.
//

import Foundation
import UIKit
import Combine

class PostAPI {
    
    func post(_ url: URL, parameters: [String: Any], image: UIImage, fileName: String, imageParametr: String) {
        var urlRequest: URLRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        
        let boundary = generateBoundaryString()
        urlRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = generateBody(boundary: boundary, parameters: parameters,
                                           image: image, fileName: fileName, imageParametr: imageParametr)
        URLSession.shared.dataTask(with: urlRequest)
        { (data, response, error) in
            guard let data = data else {
                print("you lose")
                return
            }

            let responseStr: String = String(data: data, encoding: .utf8) ?? ""
            print(responseStr)
            print("Загрузка завершена, посмотри информацию в первой вкладке")
        }
        .resume()
    }
    
    private func generateBody(boundary: String, parameters: [String: Any],
                              image: UIImage, fileName: String, imageParametr: String) -> Data {
        var data = Data()
        
        for (key, value) in parameters {
            print("Ser ", key, value)
            data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
            data.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n".data(using: .utf8)!)
            data.append("\(value)\r\n".data(using: .utf8)!)
        }
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"\(imageParametr)\"; filename=\"\(fileName)\"\r\n".data(using: .utf8)!)
        data.append("Content-Type: image/png\r\n\r\n".data(using: .utf8)!)
        data.append(image.pngData()!)
        data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
        
        return data
    }
    
    private func generateBoundaryString() -> String {
        return "Boundary-\(NSUUID().uuidString)"
    }
}
