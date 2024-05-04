//
//  MockDataService.swift
//  TopUsersTests
//
//  Created by Jidh George on 03/05/2024.
//

import Foundation

/**:
    MockDataService with dummy Data
 */
struct MockDataService: DataServiceProtocol {
    let testData = [User(userId: 1234124,
                        displayName: "Aztec",
                        reputation: 623132,
                        profileImage: "google.com/urls/imge",
                       location: "Windsor Castle, UK"),
    
                    User(userId: 1234134,
                                        displayName: "Maya",
                                        reputation: 323132,
                                        profileImage: "google.com/urls/imge",
                                       location: "Richmond, London")]

    var users: [User]? = nil
    
    init(usersData: [User]? = nil) {
        self.users = usersData
        
    }
    func fetchUsers(url: String) async throws -> [User] {
        return  users ?? testData
    }
}

struct MockNoDataService: DataServiceProtocol {
    var users: [User]? = nil
    
    init(usersData: [User]? = nil) {
        self.users = usersData
        
    }
    func fetchUsers(url: String) async throws -> [User] {
        throw DataServiceError.httpResponseError
    }
}
