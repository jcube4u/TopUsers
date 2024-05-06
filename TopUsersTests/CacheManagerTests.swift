//
//  CacheManagerTests.swift
//  TopUsersTests
//
//  Created by Jidh George on 05/05/2024.
//


@testable import TopUsers
import XCTest



final class CacheManagerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_CacheManager_init_Nil() {
        
        var cacheManager = CacheManager(store: MockUserDefaultsStore())
        XCTAssertNotNil(cacheManager)
    }
    
    func test_CacheManager_init_notNil() {
        
        var cacheManager = CacheManager(store: MockUserDefaultsStore())
        cacheManager.followUser(userId: "112312")
        cacheManager.followUser(userId: "112392")
        
        print(cacheManager.followedUsers())
        XCTAssertTrue(cacheManager.followedUsers().count == 2)
    }
    
    
    func test_CacheManager_follow2_unfollow1User_returns1User() {
        
        var cacheManager = CacheManager(store: MockUserDefaultsStore())
        cacheManager.followUser(userId: "112312")
        cacheManager.followUser(userId: "112392")
        
        cacheManager.unfollow(userId: "112392")
        
        XCTAssertTrue(cacheManager.followedUsers().count == 1)
    }
    
    
    func test_CacheManager_follow10_unfollow5User_returns5User() {
        
        var cacheManager = CacheManager(store: MockUserDefaultsStore())
        cacheManager.followUser(userId: "112311")
        cacheManager.followUser(userId: "112392")
        
        cacheManager.followUser(userId: "112313")
        cacheManager.followUser(userId: "112394")
        
        cacheManager.followUser(userId: "112315")
        cacheManager.followUser(userId: "112396")
        
        cacheManager.followUser(userId: "112317")
        cacheManager.followUser(userId: "112398")
        
        cacheManager.followUser(userId: "112319")
        cacheManager.followUser(userId: "112320")
        
        cacheManager.unfollow(userId: "112392")
        
        XCTAssertTrue(cacheManager.followedUsers().count == 9)
    }
    
    func test_CacheManager_followSameUserTwice_saveUserOnce() {
        
        var cacheManager = CacheManager(store: MockUserDefaultsStore())
        cacheManager.followUser(userId: "112311")
        cacheManager.followUser(userId: "112311")
        
        XCTAssertTrue(cacheManager.followedUsers().count == 1)
    }

}
