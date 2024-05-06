//
//  Constants.swift
//  TopUsers
//
//  Created by Jidh George on 03/05/2024.
//

import Foundation

/**:
    Maintain list of values   .
 */
struct Constants {
    
    /// Period of Splash display to include any animation
    static let splashScreenDisplayPeriod = 2.5
    
    /// Number of user we want to fetch per requet
    static let userListPagesize: Int = 5
    
    /// Stack Overflow request url to fetch list if Users
    static let stackOverflowFetchUsersUrl =  "https://api.stackexchange.com/2.2/users?pagesize=\(userListPagesize)&order=desc&sort=reputation&site=stackoverflow"
}
