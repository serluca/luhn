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
		XCTAssertTrue(Luhn.verify(string: "79927398713")) // From wikipedia https://en.wikipedia.org/wiki/Luhn_algorithm
		XCTAssertFalse(Luhn.verify(string: "79927398712"))
		XCTAssertTrue(Luhn.verify(string: "61789372994"))
		XCTAssertFalse(Luhn.verify(string: "61789372995"))
    }
	
	func testGenerate() {
		XCTAssertEqual(Luhn.generate(baseString: "7992739871"), "3") // From wikipedia https://en.wikipedia.org/wiki/Luhn_algorithm
		XCTAssertEqual(Luhn.generate(baseString: "6178937299"), "4")
	}
 
	func testVerifyCustomAlphabet() {
		XCTAssertTrue(Luhn.verify(string: "swiftl", alphabet: LuhnTests.customAlphabet))
		XCTAssertFalse(Luhn.verify(string: "swiftz", alphabet: LuhnTests.customAlphabet))
	}
	
	func testGenerateCustomAlphabet() {
		XCTAssertEqual(Luhn.generate(baseString: "swift", alphabet: LuhnTests.customAlphabet), "l")
	}
}
