//
//  Luhn+Error.swift
//  Luhn
//
//  Created by Luca Serpico on 10/10/2016.
//  Copyright © 2016 Luca Serpico. All rights reserved.
//

import Foundation


/// Enum describing errors that can occur
public enum LuhnError: Error{
	/// Thrown when a character was not found in the given Alphabet
	case characterNotFound(Character, String)
}

extension LuhnError : CustomStringConvertible {
	public var description: String {
		switch self {
		case .characterNotFound(let character, let alphabet):
			return "Character `\(character)` not found in the alphabet `\(alphabet)`"
		}
	}
}
