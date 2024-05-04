//
//  TopUsersDataService.swift
//  TopUsers
//
//  Created by Jidh George on 03/05/2024.
//

import Foundation
import Observation

@Observable
class TopUsersDataService: DataServiceProtocol {
    
    /// Fetch Users  that returns TopUsers for the the given URL
    func fetchUsers(url: String) async throws -> [User] {
        guard let url =  URL(string: url)else {
            throw DataServiceError.invalidURL
        }
        
        print(url)
        let urlRequest = URLRequest(url: url)
        var topusers: TopUsers = TopUsers(items: [])
        do {
            let (data,_) = try await URLSession.shared.data(for: urlRequest)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            topusers = try decoder.decode(TopUsers.self, from: data)
            
        } catch let error {
            print(error)
        }
        return topusers.items
    }
    
    
    
}
