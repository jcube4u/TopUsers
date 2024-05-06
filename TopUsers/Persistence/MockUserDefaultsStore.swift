//
//  MockUserDefaults.swift
//  TopUsers
//
//  Created by Jidh George on 06/05/2024.
//

import Foundation


class MockUserDefaultsStore : DataStorageProtocol {
    
    var mockuserDefaults = [String]()
    
    func saveUserData(list: [String], key: String) {
        mockuserDefaults = list
    }
    
    func getFollowedUsers(key: String) -> [String] {
        return mockuserDefaults
    }
}
