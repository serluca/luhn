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
