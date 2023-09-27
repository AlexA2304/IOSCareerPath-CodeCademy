//
//  Magic8Ball.swift
//  Magic8Ball
//
//  Created by Alex Archer on 8/21/23.
//

/*
 PROJECT DIRECTIONS:
 1) In Magic8Ball.swift, declare a constant playerName and assign it your (or any) name.
 2) Declare another constant playerQuestion and assign it a “Yes” or “No” question for the Magic 8 Ball.
 3) Declare a constant randomNumber and assign it a randomly generated value between 1 and 9, printing it to verify the randomness.
 4) Declare a constant eightBall to hold a String value; leave it unassigned for now.
 5) Create a switch statement using randomNumber, with 9 cases to assign one of the 9 possible Magic 8 Ball answers to eightBall.
 6) Add a default statement to the switch, assigning the String "Error" to eightBall.
 7) Add a print statement to output the player's name followed by their question.
 8) Add a second print statement to output the Magic 8 Ball's answer.
 9) Run the program to see random answers; celebrate your awesome work! 🎉
 10) Set up an if/else statement to handle an empty playerName String, printing only the question if the name is empty.
 11) Convert the if/else statement from step 10 into a one-liner using the ternary conditional operator.
 */

import Foundation

let playerName = "Alex"
let playerQuestion = "Will it snow on christmas 2024 in Boulder, Colorado?"
let randomNumber = Int.random(in: 1...9)
let eightBall: String

switch randomNumber {
  case 1:
    eightBall = "Yes - definitely"
  case 2:
    eightBall = "It is decidedly so"
  case 3:
    eightBall = "Without a doubt"
  case 4:
    eightBall = "Reply hazy, try again"
  case 5:
    eightBall = "Ask again later"
  case 6:
    eightBall = "Better not tell you now"
  case 7:
    eightBall = "My sources say no"
  case 8:
    eightBall = "Outlook not so good"
  case 9:
    eightBall = "Very doubtful"
  default:
    eightBall = "Error"
}

playerName.isEmpty ? print("\(playerName) asks: \(playerQuestion)") : print("\(playerQuestion)")

print("Magic 8 Ball's answer: \(eightBall)'")
