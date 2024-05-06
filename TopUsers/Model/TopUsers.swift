//
//  TopUsers.swift
//  TopUsers
//
//  Created by Jidh George on 03/05/2024.
//

import Foundation

struct TopUsers: Codable,Equatable {
    var items:[User]
}

@Observable
class User: Codable, Equatable, CustomStringConvertible{
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.userId == rhs.userId
    }
    
    let userId: Int
    let displayName: String
    let reputation: Int
    let profileImage: String
    var location: String?
    
    /// IsFollowed is a  Custom property addition to be updated -
    /// Follow or unfollow this user
    var isFollowed: Bool? = false
    
    
    var description: String {
        return "\(userId) is  followed ? -\(String(describing: isFollowed))"
    }
    
    init(userId: Int, displayName: String, reputation: Int, profileImage: String, location: String? = "", isFollowed: Bool? = false) {
        self.userId = userId
        self.displayName = displayName
        self.reputation = reputation
        self.profileImage = profileImage
        self.location = location
        self.isFollowed = isFollowed
    }
}
