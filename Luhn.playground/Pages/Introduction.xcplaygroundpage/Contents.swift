/*:
> # IMPORTANT: To use **Luhn.playground**:
1. Open **Luhn.xcworkspace**.
1. Build the **Luhn** scheme (**Product** → **Build**).
1. Open **Luhn** playground in the **Project navigator**.
1. Show the Debug Area (**View** → **Debug Area** → **Show Debug Area**).
*/

import Luhn

// Decimal Alphabet
try Luhn.generate(baseString: "7992739871")
try Luhn.verify(string: "79927398713")
try Luhn.verify(string: "79927398714")


// Custom Alphabet
let alphabet = "abcdefghijklmnopqrstuvwxyz"
try Luhn.generate(baseString: "swift", alphabet: alphabet)
try Luhn.verify(string: "swiftl", alphabet: alphabet)
try Luhn.verify(string: "swiftz", alphabet: alphabet)