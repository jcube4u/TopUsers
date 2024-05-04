//
//  MockDataService.swift
//  TopUsersTests
//
//  Created by Jidh George on 03/05/2024.
//

import Foundation
@testable import TopUsers

struct MockDataService: DataServiceProtocol {
    func fetchUsers(url: String) async throws -> [User] {
        let user = User(userId: 1234124,
                                 displayName: "Aztec",
                                 reputation: 123132,
                                 profileImage: "google.com/urls/imge",
                                location: "Windsor Castle, UK")
        return [user]
    }

}
