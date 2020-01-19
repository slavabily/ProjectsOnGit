//
//  ProjectsOnGitTests.swift
//  ProjectsOnGitTests
//
//  Created by slava bily on 12/1/20.
//  Copyright © 2020 slava bily. All rights reserved.
//

import XCTest
@testable import ProjectsOnGit

class ProjectsOnGitTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testNavigationDelegateAllowsGoodSite() {
        let sut = NavigationDelegate()
        let url = URL(string: "https://github.com")
        
        XCTAssertTrue(sut.isAllowed(url: url))
    }
    
    func testNavigationDelegateDisallowsBadSite() {
        let sut = NavigationDelegate()
        let url = URL(string: "https://google.com")
        
        XCTAssertFalse(sut.isAllowed(url: url))
    }

}
