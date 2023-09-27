//
//  QuadraticFormula.swift
//  Module3-Project1-QuadraticFormula
//
//  Created by Alex Archer on 8/21/23.
//

/*
 PROJECT INSTRUCTIONS:
 1) Declare three variables a, b, c to store decimal numbers for the quadratic equation coefficients.
 2) Assign values to a, b, and c: a = 2.0, b = 5.0, c = 3.0.
 3) Declare two more Double variables root1 and root2 to store the roots of the equation.
 4) Calculate the value b^2 - 4ac and assign it to root1.
 5) Find the square root of root1 using root1.squareRoot() and update root1.
 6) Update root1 to be -b plus its current value.
 7) Reassign root1 with the result of its current value divided by 2 * a.
 8) Calculate root2 using the formula −b − √(b^2 − 4ac) / 2a.
 9) Print the values of root1 and root2 using the print() function.
 10) Run the program in the terminal and verify the output for given values of a, b, and c.
 */

import Foundation

var a: Double = 3.0
var b: Double = -11.0
var c: Double = -4.0

var root1: Double = (b*b - 4*a*c)
var root2: Double = (b*b - 4*a*c)

root1 = root1.squareRoot()
root1 = -b + root1
root1 = root1 / (2*a)

root2 = root2.squareRoot()
root2 = -b - root2
root2 = root2 / (2*a)

print("The vale of Root 1 is: \(root1), and the value of Root 2 is: \(root2)")
