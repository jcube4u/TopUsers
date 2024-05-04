//
//  DataServiceProtocol.swift
//  TopUsers
//
//  Created by Jidh George on 03/05/2024.
//

import Foundation
/// Data Service protocol for conforming Types`
///
/// - Protocol : Data Service protocol that could be to conform to Service Types

/// - Returns: TopUsers.items
///
/// - Throws: DataServiceError
protocol  DataServiceProtocol {
    func fetchUsers(url: String) async throws -> [User]
}

