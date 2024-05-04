//
//  MockDataService.swift
//  TopUsersTests
//
//  Created by Jidh George on 03/05/2024.
//

import Foundation
@testable import TopUsers

struct MockDataService: DataServiceProtocol {
    func fetchUsers(url: String) async throws -> TopUsers {
        let user = TopUsers.User(userId: 1234124, displayName: "Aztec", reputation: 123132, profileImage: "google.com/urls/imge")
        return TopUsers(items: [user])
    }
}
