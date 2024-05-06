//
//  DataStorageProtocol.swift
//  TopUsers
//
//  Created by Jidh George on 06/05/2024.
//

import Foundation

/**:
    DataStorageProtocol for FollowUsers,.
    using protocol allows us the swap thte concrete types as needed
 */

protocol DataStorageProtocol {
    
    func saveUserData(list: [String], key: String)
    
    func getFollowedUsers(key: String) -> [String]
}
