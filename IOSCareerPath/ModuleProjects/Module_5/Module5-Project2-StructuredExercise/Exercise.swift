//
//  Exercise.swift
//  Module5-Project2-StructuredExercise
//
//  Created by Alex Archer on 8/21/23.
//

/*
 PROJECT INSTRUCTIONS:
1) Create the Exercise structure to model real-life exercises with properties: name, muscle groups, repetitions, sets, and total repetitions.
2) Define the Exercise structure with specific properties: name as String, muscleGroups as [String], reps as Int, sets as Int, totalReps as Int.
3) Set up the init() method in Exercise with parameters: name: String, muscleGroups: [String], reps: Int, sets: Int.
4) Inside the init() method, assign parameter values to the respective properties.
5) Create an instance of Exercise, e.g., a variable called pushUp with specific arguments.
6) Print out the pushUp instance to check it, and possibly create more Exercise instances.
7) Plan for another structure to model a regimen, tracking the day of the week and storing Exercise instances.
8) Implement the Regimen structure with properties: dayOfWeek as String, exercises as [Exercise].
9) In the Regimen’s init(), assign self.dayOfWeek and self.exercises their respective values.
10) Test the Regimen structure by creating an instance like mondayRegimen, and then print it.
11) Add a printExercisePlan() method to the Regimen structure without parameters or return value.
12) Inside printExercisePlan(), print the day of the week and an introductory phrase.
13) Add a for-in loop in printExercisePlan() to iterate over self.exercises.
14) Inside the loop, add print() statements to detail the exercises to do, sets, and reps.
15) Include another print() in the loop to list out the total repetitions required for each exercise.
16) Test the .printExercisePlan() method by calling it on an instance like mondayRegimen.
17) Consider additional challenges such as creating more Exercise or Regimen instances or adding a mutating method to Regimen for further customization.
*/

struct Exercise {
  var name: String
  var muscleGroups: [String]
  var reps: Int
  var sets: Int
  var totalReps: Int

  init (name: String, muscleGroups: [String], reps: Int, sets: Int) {
    self.name = name
    self.muscleGroups = muscleGroups
    self.reps = reps
    self.sets = sets
    self.totalReps = sets * reps
  }
}

// ----------------------------------------------

struct Regimen {
  var dayOfWeek: String
  var exercises: [Exercise]

  init (dayOfWeek: String, exercises: [Exercise]) {
    self.dayOfWeek = dayOfWeek
    self.exercises = exercises
  }

  mutating func addExercise(_ exercise: Exercise) {
    exercises.append(exercise)
  }

  func printExercisePlan() {
    print("Today is \(self.dayOfWeek) and the plan is to:")
    for exercise in self.exercises {
      print("Do \(exercise.sets) sets of \(exercise.reps) \(exercise.name)s")
      print("That's a total of \(exercise.totalReps) \(exercise.name)s")
      print("//----------------------------------")
    }
  }
}

// ----------------------------------------------


// Declaration of Exercise instances
var pushUp = Exercise(name: "Push up", muscleGroups: ["Triceps", "Chest", "Shoulders"], reps: 10, sets: 3)
var bicepCurl = Exercise(name: "Bicep Curl", muscleGroups: ["Bicep", "Chest", "Forearm"], reps: 10, sets: 3)
var skullCrusher = Exercise(name: "Skull Crusher", muscleGroups: ["Tricep", "Forearm", "Lats"], reps: 10, sets: 3)
var legPress = Exercise(name: "Leg Press", muscleGroups: ["Quads", "Glutes"], reps: 12, sets: 3)
var squat = Exercise(name: "Squat", muscleGroups: ["Quads", "Glutes", "Hamstrings"], reps: 15, sets: 3)

// Declaration of Regimen instances
var mondayRegimen = Regimen(dayOfWeek: "Monday", exercises: [pushUp, bicepCurl, skullCrusher])
var wednesdayRegimen = Regimen(dayOfWeek: "Wednesday", exercises: [legPress, squat])

// Adding an exercise to a regimen
mondayRegimen.addExercise(squat)

// Printing the plans
mondayRegimen.printExercisePlan()
wednesdayRegimen.printExercisePlan()
