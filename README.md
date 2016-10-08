Base indipendent Luhn
===

[![Twitter: @serluca](https://img.shields.io/badge/contact-@serluca-blue.svg?style=flat)](https://twitter.com/serluca)
[![License](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/fastlane/fastlane/blob/master/LICENSE)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/Luhn.svg)](https://img.shields.io/cocoapods/v/Luhn.svg)
[![Platform](https://img.shields.io/cocoapods/p/Luhn.svg?style=flat)](http://cocoadocs.org/docsets/Luhn)

A base-independent implementation of the Luhn algorithm for Swift. Useful for generating and verifying check digits in arbitrary bases.

To consider a porting of [https://github.com/benhodgson/baluhn](https://github.com/benhodgson/baluhn) in swift.

From Wikipedia:

> The Luhn algorithm or Luhn formula, also known as the "modulus 10" or "mod 10" algorithm, is a simple checksum formula used to validate a variety of identification numbers, such as credit card numbers, IMEI numbers, National Provider Identifier numbers in US and Canadian Social Insurance Numbers

# Installation
[CocoaPods](https://github.com/CocoaPods/CocoaPods) is a dependency manager for Cocoa projects. You can install it with the following command:

`$ gem install cocoapods`

To integrate Luhn into your Xcode project using CocoaPods, specify it in your Podfile:

```
source 'https://github.com/CocoaPods/Specs.git'
use_frameworks!

pod 'Luhn'
```

# Usage
Luhn provides two functions: `verify` and `generate`.

`generate` calculates the Luhn check character for the given input string in the given base. This character should be appended to the input string to produce a valid Luhn string. 

`verify` tests whether or not a string is a valid Luhn string in the given base. By default, luhn operates in base 10:

To use it, just import Luhn in your project`import Luhn`

# Example
Clone and open the playground to see a live usage of the library.

```
// Genereta a value to have a valid luhn using the decimal alphabet
Luhn.generate("6178937299") // Returns 4
// Verify if the string is a valid luhn using the decimal alphabet
Luhn.verify("61789372994") // A valid luhn
Luhn.verify("61789372995") // An invalid luhn

// Using a defined alphabet
Luhn.verify("61789372994", alphabet: "0123456789") // A valid luhn
Luhn.verify("61789372995", alphabet: "0123456789") // An invalid luhn

// Defining a custom alphabet
let alphabet = "abcdefghijklmnopqrstuvwxyz"
Luhn.generate("swift", alphabet: alphabet) // Returns l
Luhn.verify("swiftl", alphabet: alphabet) // A valid luhn
Luhn.verify("swiftz", alphabet: alphabet) // An invalid luhn

```


# Special Thanks
Special thanks to @benhodgson

# License

Luhn is released under the MIT license. See LICENSE for details.