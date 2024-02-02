//
//  ServiceManager.swift
//  PhotoniOSTest
//
//  Created by DEEPTHI on 2/2/24.
//

import Foundation
import Combine

protocol WebSertviceProtocol {
    func getData<T: Codable>(fromUrl: String) async -> T?
}

class WebService: WebSertviceProtocol {
    func getData<T: Codable>(fromUrl: String) async -> T? {
        do {
            guard let url = URL(string: fromUrl) else {
                return nil
            }
            let (data,_) = try await URLSession.shared.data(from: url)
            let decodeResponse = try? JSONDecoder().decode(T.self, from: data)
            return decodeResponse
        } catch {
            print("Error")
        }
        
        return nil
    }
    
}

class MockWebService: WebSertviceProtocol {
    func getData<T: Codable>(fromUrl: String) async -> T? {
        guard let path = Bundle.main.path(forResource: "MockResponse", ofType: "json") else { return nil }
        let jsonData = try! Data(contentsOf: URL(filePath: path))
        let decodeResponse = try? JSONDecoder().decode(T.self, from: jsonData)
        return decodeResponse
        
    }
}
