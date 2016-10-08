// Luhn.swift
//
// Copyright (c) 2016 Luca Serpico
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.


import Foundation

/**
A base-independent implementation of the Luhn algorithm for Swift. Useful for generating and verifying check digits in arbitrary bases. https://github.com/serluca/luhn
*/
public class Luhn{
	private static func luhn(string: String, alphabet: String) -> Int {
		let base: Int = alphabet.characters.count
		let reversedInts = string.characters.reversed().map { alphabet.index(of: $0) }
		
		return reversedInts.enumerated().reduce(0, {(sum, val) in
			let odd = val.offset % 2 == 1
			return sum + (odd ? ((val.element! / (base/2)) + ((2*val.element!) % base)) : val.element!)
		}) % base
	}
	
	/**
	Calculates the Luhn check character for the given input string. This
	character should be appended to the input string to produce a valid Luhn 
	string in the given base.
	
	@param baseString Consectetur adipisicing elit.
	@param alphabet The alphabet to use, by default it uses the decimal alphabet
	
	@return The character to append to the baseString to have a valid Luhn string in the given base
	*/
	public static func generate(baseString: String, alphabet: String = "0123456789") -> Character {
		var d = luhn(string: baseString + String(alphabet.character(at: 0)), alphabet: alphabet)
		if d != 0 {
			d = alphabet.characters.count - d
		}
		return alphabet.character(at: d)
	}

	/**
	Verifies that the given string is a valid Luhn string in the given alphabet.
	
	@param string The string to verify
	@param alphabet The alphabet to use, by default it uses the decimal alphabet
	
	@return A boolean value that indicates wheter or not the string is a valid Lunh string in the given alphabet
	*/
	public static func verify(string: String, alphabet: String = "0123456789") -> Bool {
		return luhn(string: string, alphabet: alphabet) == 0
	}
}

extension String{
	
	func character(at index: Int) -> Character {
		return self[self.index(self.startIndex, offsetBy: index)]
	}
	
	func index(of character: Character) -> Int? {
		let range: Range<String.Index>? = self.range(of: String(character))
		if let startingIndex = range?.lowerBound {
			return self.distance(from: self.startIndex, to: startingIndex)
		} else {
			return nil
		}
	}
}
