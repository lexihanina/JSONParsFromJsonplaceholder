//
//  NetworkManager.swift
//  JSONParsFromJsonplaceholder
//
//  Created by Lexi Hanina on 27.01.24.
//

import Foundation

class NetworkManager {
    static let shared: NetworkManager = NetworkManager()
    
    private init() {}
    
    func makeGETRequest(withURL: URL?) async throws -> Data {
        guard let url = withURL
        else {
            throw Errors.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw Errors.invalidResponse
        }
        
        return data
    }
}
