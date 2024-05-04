//
//  TopUsers.swift
//  TopUsers
//
//  Created by Jidh George on 03/05/2024.
//

import Foundation

struct TopUsers: Codable,Equatable {
    let items:[User]
}

struct User: Codable, Equatable {
    let userId: Int
    let displayName: String
    let reputation: Int
    let profileImage: String
    let location: String?
}
