//
//  SearchResultController_Tests.swift
//  SearchResultController Tests
//
//  Created by Michael Stoffer on 9/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import iTunes_Search

class SearchResultController_Tests: XCTestCase {
    
    // Does it build the correct URL?
    // Does it build the correct URL Request?
    // Is the completion handler called if the networking fails?
    
    // Does decoding actually work?
    // Are the results saved properly?
    func testNetworkForSomeResults() {
        let controller = SearchResultController()
        
        let expection = expectation(description: "Wait for results")
        
        controller.performSearch(for: "Garage Band", resultType: .software) {
            expection.fulfill()
        }
        
        wait(for: [expection], timeout: 2)
        
        XCTAssertTrue(controller.searchResults.count > 0, "Expecting at least one result for GarageBand")
    }
    
    // Is the completion handler called if the data is good?
    func testForGoodResults() {
        let mock = MockDataLoader()
        mock.data = goodResultsData
        let controller = SearchResultController(dataLoader: mock)
        
        let resultsExpection = expectation(description: "Wait for results")
        
        controller.performSearch(for: "Garage Band", resultType: .software) {
            resultsExpection.fulfill()
        }
        
        wait(for: [resultsExpection], timeout: 2)
        
        XCTAssertTrue(controller.searchResults.count == 2, "Expecting 2 results for GarageBand")
        XCTAssertEqual("GarageBand", controller.searchResults[0].title)
        XCTAssertEqual("Apple", controller.searchResults[0].artist)
        XCTAssertEqual("Shortcut: GarageBand Edition", controller.searchResults[1].title)
        XCTAssertEqual("Mark Keroles", controller.searchResults[1].artist)
    }
    
    // Is the completion handler called if the data is bad?
    // Does decoding fail when given bad data?
    func testForBadResults() {
        let mock = MockDataLoader()
        mock.data = badResultsData
        let controller = SearchResultController(dataLoader: mock)
        
        let resultsExpection = expectation(description: "Wait for results")
        
        controller.performSearch(for: "Garage Band", resultType: .software) {
            resultsExpection.fulfill()
        }
        
        wait(for: [resultsExpection], timeout: 2)
        
        XCTAssertTrue(controller.searchResults.count == 0, "Expecting no results for GarageBand using bad data")
        XCTAssertNotNil(controller.error)
    }
    
    func testForNoResults() {
        let mock = MockDataLoader()
        mock.data = noResultsData
        let controller = SearchResultController(dataLoader: mock)
        
        let resultsExpection = expectation(description: "Wait for results")
        
        controller.performSearch(for: "Garage Band", resultType: .software) {
            resultsExpection.fulfill()
        }
        
        wait(for: [resultsExpection], timeout: 2)
        
        XCTAssertTrue(controller.searchResults.count == 0, "Expecting no results for GarageBand using no results data")
        XCTAssertNil(controller.error)
    }
}
