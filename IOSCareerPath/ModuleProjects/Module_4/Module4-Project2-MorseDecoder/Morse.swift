//
//  File.swift
//  Module4-Project2-MorseDecoder
//
//  Created by Alex Archer on 8/21/23.
//

/*
 PROJECT INSTRUCTIONS:
1) Examine the variables englishText and secretMessage in Morse.swift to translate English into Morse code.
2) Create a dictionary called letterToMorse to store letters and their Morse counterparts.
3) Create an empty String named morseText for the encrypted message.
4) Use a for-in loop to iterate through englishText, naming the placeholder element.
5) In the loop, use an if-let to assign morseChar from letterToMorse, using element as the key.
6) Fix the type error by changing element to a String using string interpolation.
7) Inside the if-let, append morseChar and a space to morseText.
8) Create an else statement to append three spaces for word separation.
9) Print morseText to check the encoded message.
10) Create an empty String named decodedMessage for the decoded version.
11) Create an empty String array called morseCodeArray to store Morse code letters.
12) Create an empty String called currMorse for tracking current Morse code letter.
13) Iterate through secretMessage, using space rules to detect letters and words.
14) Check char values in loop, appending non-space characters to currMorse.
15) Create an else statement with a switch on currMorse to handle spaces.
16) Set up switch cases to manage space handling in Morse code translation.
17) Finish populating morseCodeArray with currMorse and print its value.
18) Create an empty dictionary called morseToLetter with Morse as keys.
19) Use a for-in loop to populate morseToLetter by iterating through letterToMorse.
20) Add key-value pairs to morseToLetter and check its values with print().
21) Start decoding by iterating through morseCodeArray, naming placeholder morseValue.
22) Use an if-let statement to assign letterChar from morseToLetter using morseValue.
23) Append letterChar to decodedMessage inside the if-let statement.
24) If morseValue is not a key in morseToLetter, append a space to decodedMessage.
25) Print decodedMessage to reveal the secret message.
26) Optionally, add punctuation handling and apply character casing modifications.
*/

import Foundation

var englishText = "this is a secret message. how are you?"

var secretMessage = ".... --- .-- -.. -.--   .--. .- .-. - -. . .-. -.-.--"

// Add your code below 🤫

var letterToMorse = [
  "a": ".-", "b": "-...", "c": "-.-.", "d": "-..", "e": ".", "f": "..-.", "g": "--.", "h": "....", "i": "..", "j": ".---", "k": "-.-", "l": ".-..", "m": "--", "n": "-.", "o": "---", "p": ".--.", "q": "--.-", "r": ".-.", "s": "...", "t": "-", "u": "..-", "v": "...-", "w": ".--", "x": "-..-", "y": "-.--", "z": "--..",
  ".": ".-.-.-", "?": "..--..", ",": "--..--", "!": "-.-.--"
]

var morseText: String = ""

for element in englishText.lowercased() {
  if let morseChar = letterToMorse["\(element)"] {
    morseText += morseChar + " "
  } else {
    morseText += "   "
  }
}

print(morseText)

var decodedMessage: String = ""
var morseCodeArray = [String]()
var currMorse: String = ""
var capitalizeNext = true

for char in secretMessage {
  if char != " " {
    currMorse.append(char)
  } else {
    switch currMorse {
      case "":
        currMorse += " "
      case " ":
        morseCodeArray.append(" ")
        currMorse = ""
      default:
        morseCodeArray.append(currMorse)
        currMorse = ""
    }
  }
}

morseCodeArray.append(currMorse)
print(morseCodeArray)

var morseToLetter = [String: String]()

for (letter, morseChar) in letterToMorse {
  morseToLetter[morseChar] = letter
}

for morseValue in morseCodeArray {
  if let letterChar = morseToLetter[morseValue] {
    if capitalizeNext && letterChar != "." && letterChar != "?" && letterChar != "," && letterChar != "!" {
      decodedMessage += letterChar.uppercased()
      capitalizeNext = false
    } else {
      decodedMessage += letterChar
    }
    if letterChar == "." || letterChar == "?" || letterChar == "!" {
      capitalizeNext = true
    }
  } else {
    decodedMessage += " "
  }
}

print(decodedMessage)
