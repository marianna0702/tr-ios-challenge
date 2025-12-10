//
//  MovieTakeHomeTests.swift
//  MovieTakeHomeTests
//
//  Created by Marianna on 12/9/25.
//

import XCTest
@testable import MovieTakeHome

final class DateFormattingTests: XCTestCase {
    
    func testYearString() throws {
        XCTAssertEqual(2024.yearString, "2024")
        XCTAssertEqual(2000.yearString, "2000")
        XCTAssertEqual(1990.yearString, "1990")
        XCTAssertEqual(2025.yearString, "2025")
        
        XCTAssertEqual(0.yearString, "0")
        XCTAssertEqual(1970.yearString, "1970")
    }
    
    func testFullDateString() throws {
        let timestamp2024 = 1765347674
        let dateString2024 = timestamp2024.fullDateString
        XCTAssertFalse(dateString2024.isEmpty)
        XCTAssertTrue(dateString2024.contains("2025") && dateString2024.contains("Dec"))
    }
    
    func testFullDateStringWithDifferentTimestamps() throws {
        let timestamps = [946684800, 1000000000, 1500000000]
        
        for timestamp in timestamps {
            let dateString = timestamp.fullDateString
            XCTAssertFalse(dateString.isEmpty, "Date string should not be empty for timestamp \(timestamp)")
            
            
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            formatter.timeStyle = .none
            let expectedString = formatter.string(from: Date(timeIntervalSince1970: TimeInterval(timestamp)))
            XCTAssertEqual(dateString, expectedString, "Date string should match expected format for timestamp \(timestamp)")
        }
    }

}
