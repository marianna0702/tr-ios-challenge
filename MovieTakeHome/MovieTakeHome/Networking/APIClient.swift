//
//  APIClient.swift
//  MovieTakeHome
//
//  Created by Marianna on 12/9/25.
//

import Foundation

struct APIClient {
    
    func requestData<T: Codable>(for endpoint: Endpoint) async throws -> T {
        guard let url = endpoint.url else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard
            let response = response as? HTTPURLResponse,
            response.statusCode == 200
        else {
            throw NetworkError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            throw NetworkError.invalidData
        }
    }
    
}

enum Endpoint {
    case list
    case details(id: Int)
    case recommend(id: Int)
    
    var path: String {
        switch self {
            case .list:
                return "/list.json"
            case .details(let id):
                return "/details/\(id).json"
            case .recommend(let id):
                return "/details/recommended/\(id).json"
        }
    }
    
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "raw.githubusercontent.com"
        components.path = "/TradeRev/tr-ios-challenge/master\(path)"
        return components.url
    }
}

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
