//
//  CaesarsCipher.swift
//  Module4-Project1-CaesarsCipher
//
//  Created by Alex Archer on 8/21/23.
//

/*
1) Declare an array named alphabet containing all English letters.
2) Modify the declaration of alphabet to be of type [Character].
3) Declare a variable secretMessage and assign the value "hello".
4) Print secretMessage to verify its value.
5) Convert secretMessage to an array of Characters and store it in a variable called message.
6) Print the message array to verify its structure.
7) Create a for-in loop that iterates through the characters of message.
8) Inside the first loop, create another loop to iterate through characters of alphabet (nested loop).
9) Compare each character of message with alphabet, and replace with the letter three places to the right.
10) Break the inner loop after shifting the character.
11) Print the modified message after the nested loop.
12) Test the code with a new secretMessage and identify the "out of range" error.
13) Fix the error by using the remainder operator % to wrap around the alphabet.
14) (Optional) Convert the encrypted message to a String and handle capital letters by lowercasing them before encryption.
*/

import Foundation

var alphabet: [Character] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

var secretMessage: String = "CodeCademy"

var message = Array(secretMessage.lowercased())

for i in 0..<message.count {
  for j in 0..<alphabet.count {
    if message[i] == alphabet[j] {
      message[i] = alphabet[(j+3)%26]
      break
    }
  }
}

let encryptedMessage = String(message)

print(encryptedMessage)
