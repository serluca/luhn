//
//  LuhnTests.swift
//  LuhnTests
//
//  Created by Luca Serpico on 08/10/2016.
//  Copyright © 2016 Luca Serpico. All rights reserved.
//

import XCTest
@testable import Luhn

class LuhnTests: XCTestCase {
    static let customAlphabet = "abcdefghijklmnopqrstuvwxyz"
    
    func testVerify() {
		XCTAssertTrue(try Luhn.verify(string: "79927398713")) // From wikipedia https://en.wikipedia.org/wiki/Luhn_algorithm
		XCTAssertFalse(try Luhn.verify(string: "79927398712"))
		XCTAssertTrue(try Luhn.verify(string: "61789372994"))
		XCTAssertFalse(try Luhn.verify(string: "61789372995"))
    }
	
	func testGenerate() {
		XCTAssertEqual(try Luhn.generate(baseString: "7992739871"), "3") // From wikipedia https://en.wikipedia.org/wiki/Luhn_algorithm
		XCTAssertEqual(try Luhn.generate(baseString: "6178937299"), "4")
	}
 
	func testVerifyCustomAlphabet() {
		XCTAssertTrue(try Luhn.verify(string: "swiftl", alphabet: LuhnTests.customAlphabet))
		XCTAssertFalse(try Luhn.verify(string: "swiftz", alphabet: LuhnTests.customAlphabet))
	}
	
	func testGenerateCustomAlphabet() {
		XCTAssertEqual(try Luhn.generate(baseString: "swift", alphabet: LuhnTests.customAlphabet), "l")
	}
	
	func testInvalidCharacter(){
		do {
			_ = try Luhn.verify(string: "7992739871a")
			XCTFail("Luhn should have thrown for an invalid value")
		} catch let error as LuhnError {
			// Test passed
			XCTAssertNotNil(error)
		} catch {
			XCTFail("Luhn did not return the correct error type. Error: \(error)")
		}
	}
}
