//
//  RockPaperScissors.swift
//  Module5-Project1-RockPaperScissors
//
//  Created by Alex Archer on 8/21/23.
//

/*
 PROJECT INSTRUCTIONS:
1) Create a function getUserChoice that takes a String and returns a valid choice of "rock", "paper", or "scissors".
2) Within getUserChoice, use an if/else statement to validate the input and return the choice or an error message.
3) Call getUserChoice with an argument and wrap in a print statement, then remove the print once confirmed.
4) Declare getComputerChoice function to determine the computer's choice and return as a String.
5) Inside getComputerChoice, generate a random number and use a switch to return the corresponding move choice.
6) Outside the function, call getComputerChoice and wrap in a print statement, then remove the print once confirmed.
7) Declare a function determineWinner that accepts two Strings and returns the result as a String.
8) In determineWinner, create a switch statement to check user's choice against computer's and set a decision variable.
9) Set up a case in the switch for "paper" and use if/else if to compare against computer's choice.
10) Set up a case in the switch for "scissors" and use if/else if to compare against computer's choice, then return decision.
11) To play, call getUserChoice and getComputerChoice, storing them in constants userChoice and compChoice.
12) Print the user’s choice, the computer’s choice, and call determineWinner to display the result.
13) Test the game multiple times with different userInput values to ensure it works as expected.
*/

import Foundation

func getUserChoice(userInput: String) -> String {
  if userInput == "rock" || userInput == "paper" || userInput == "scissors" {
    return userInput
  } else {
    return "You can only enter rock, paper, or scissors. Try again."
  }
}

// ---------------------------------------------

func getComputerChoice() -> String {
  let randomNumber = Int.random(in: 0...2)
  switch randomNumber {
    case 0:
      return "rock"
    case 1:
      return "paper"
    case 2:
      return "scissors"
    default:
      return "Something went wrong"
  }
}

// ---------------------------------------------

func determineWinner(_ userChoice: String, _ compChoice: String) -> String {
  var decision = "It's a tie"
  switch userChoice {
    case "rock":
      if compChoice == "paper" {
        decision = "The computer won"
      } else if compChoice == "scissors" {
        decision = "The user won"
      }
    case "paper":
      if compChoice == "scissors" {
        decision = "The computer won"
      } else if compChoice == "rock" {
        decision = "The user won"
      }
    case "scissors":
      if compChoice == "rock" {
        decision = "The computer won"
      } else if compChoice == "paper" {
        decision = "The user won"
      }
    default:
      print("Something went wrong")
  }
  return decision
}

// ---------------------------------------------

let userVariable = getUserChoice(userInput: "paper")
let compVariable = getComputerChoice()

print("You threw \(userVariable)")
print("The computer threw \(compVariable)")
print(determineWinner(userVariable, compVariable))
