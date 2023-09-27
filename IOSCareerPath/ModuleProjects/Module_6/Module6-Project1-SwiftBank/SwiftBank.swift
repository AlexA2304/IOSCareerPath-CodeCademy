//
//  SwiftBank.swift
//  Module6-Project1-SwiftBank
//
//  Created by Alex Archer on 8/21/23.
//

/*
 PROJECT DIRECTIONS:
1) Define a structure named SwiftBank to represent our account.
2) Create a private constant String named password for securing the account.
3) Use an initializer to set the initial value of the password.
4) Write a private helper method isValid(_:) to check if the user's password matches.
5) Create a private variable balance of Double type for holding deposits.
6) Define a constant depositBonusRate equal to 0.01, applicable to all accounts.
7) Create a private method finalDepositWithBonus to calculate the deposit with bonus.
8) Make a method makeDeposit(ofAmount:) to handle deposits, including the bonus calculation.
9) Modify the initializer to accept an initialDeposit parameter and call makeDeposit(ofAmount:).
10) Create displayBalance(usingPassword:) method to allow users to check their balance.
11) Implement makeWithdrawal(ofAmount:usingPassword:) to enable withdrawals.
12) Add a private method displayLowBalanceMessage() and a property observer for balance under $100.
13) Test functionality with a SwiftBank instance named myAccount.
14) Make another deposit of $50.
15) Test withdrawals with correct and incorrect passwords.
16) Verify account balance using the displayBalance(usingPassword:) method.
17) Refer to the sample solution for code comparison.
18) (Optional) Build a feature to give a deposit bonus only for the first deposit of $1000 or more.
19) Implement logic to handle specific scenarios like negative/zero deposits and withdrawals, and overdrawn withdrawal.
*/

import Foundation

// Write your code below 🏦
struct SwiftBank {
  private let password: String
  private var balance: Double = 0 {
    didSet {
      if balance < 100.0 {
        displayLowBalanceMessage()
      }
    }
  }
  static let depositBonusRate = 0.01

  init(password: String, initialDeposit: Double) {
    self.password = password
    makeDeposit(depositAmount: initialDeposit)
  }

  private func isValid(enteredPassword: String) -> Bool {
    if enteredPassword == self.password {
      return true
    } else {
      return false
    }
  }

  private func finalDepositWithBonus(deposit: Double) -> Double {
    return (deposit * SwiftBank.depositBonusRate) + deposit
  }

  mutating func makeDeposit(depositAmount: Double) {
    if depositAmount <= 0 {
      print("Error: Invalid deposit amount.")
      return
    }
    let depositWithBonus = finalDepositWithBonus(deposit: depositAmount)
    print("Making a deposit of \(depositAmount) with a bonus rate. The final amount deposited is \(depositWithBonus)")
    self.balance += depositWithBonus
  }

  func displayBalance(password: String) {
    if isValid(enteredPassword: password) {
      print("Your current balance is \(self.balance)")
    } else {
      print("Error: Invalid password. Cannot retrieve balance.")
    }
  }

  mutating func makeWithdrawal(withdrawalAmount: Double, password: String) {
    if withdrawalAmount <= 0 || withdrawalAmount > self.balance {
      print("Error: Invalid withdrawal amount.")
      return
    }
    if isValid(enteredPassword: password) {
      print("Making a \(withdrawalAmount) withdrawal.")
      self.balance -= withdrawalAmount
    } else {
      print("Error: Invalid password. Cannot make withdrawal.")
    }
  }

  private func displayLowBalanceMessage() {
    print("Alert: Your balance is under $100")
  }

}

var myAccount = SwiftBank(password: "Hello", initialDeposit: 500.0)
myAccount.makeDeposit(depositAmount: 50.0)
myAccount.makeWithdrawal(withdrawalAmount: 100.0, password: "Healow")
myAccount.displayBalance(password: "Hello")
myAccount.makeDeposit(depositAmount: -50.0)
myAccount.makeWithdrawal(withdrawalAmount: -100.0, password: "Hello")
myAccount.makeWithdrawal(withdrawalAmount: 9999.0, password: "Hello")
