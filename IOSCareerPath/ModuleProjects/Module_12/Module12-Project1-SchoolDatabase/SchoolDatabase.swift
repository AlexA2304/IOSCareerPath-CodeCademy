//
//  SchoolDatabase.swift
//  Module12-Project1-SchoolDatabase
//
//  Created by Alex Archer on 8/21/23.
//

/*
 PROJECT DIRECTIONS:
1) Create a struct Student with properties: name (String) and favoriteTeacherID (Int).
2) Create a struct Teacher with properties: name (String) and id (Int).
3) Add optional properties to Teacher: email (String?) and hairColor (String?).
4) Create a struct School with properties: name (String) and a list of teachers ([Teacher]).
5) Add a method to School named getTeacher(withID:) accepting an Int ID and returning an optional Teacher.
6) In the getTeacher method, iterate over teachers, find a match by ID, or return nil if not found.
7) Add a method to School named printFavoriteTeacherInfo(for:) accepting a Student named “student”.
8) In the method, use a guard statement to bind the Teacher to a constant, print an error message if not found.
9) Print the Teacher's name and hair color, considering the hair color might be nil.
10) Print the Teacher's email address or a message that they don’t have an email account.
11) Create an array of at least three Teachers, including some with nil properties.
12) Create a constant School instance using the array of Teachers.
13) Create two new Students: one with an ID matching a Teacher, the other with a non-matching ID.
14) Print the favorite teacher information for both Students.
*/

import Foundation

struct Student {
  var name: String
  var favoriteTeacherID: Int
}

struct Teacher {
  var name: String
  var id: Int
  var email: String?
  var hairColor: String?
}

struct School {
  var name: String
  var teachers: [Teacher]

  func getTeacher(withID id: Int) -> Teacher? {
    for teacher in teachers {
      if teacher.id == id {
        return teacher
      }
    }
    return nil
  }

  func printFavoriteTeacherInfo(for student: Student) -> Void {
    guard let unwrappedTeacher = getTeacher(withID: student.favoriteTeacherID)
    else {
      print("Teacher is nil")
      return
    }
    print(unwrappedTeacher.name)
    print(unwrappedTeacher.email ?? "No Email")
    print(unwrappedTeacher.hairColor ?? "Bald")
  }
}

var mrHim = Teacher(name: "Mr.Him", id: 1, email: "him111@gmail.com", hairColor: "Black")
var msHer = Teacher(name: "Ms.Her", id: 2, email: "her222@gmail.com", hairColor: "Red")
var mrHe = Teacher(name: "Mr.He", id: 3)

var educators = [mrHim, msHer, mrHe]

var cherokeeTrail = School(name: "Cherokee Trail High School", teachers: educators)

var student1 = Student(name: "Alex Archer", favoriteTeacherID: 1)
var student2 = Student(name: "Madison Roland", favoriteTeacherID: 4)
cherokeeTrail.printFavoriteTeacherInfo(for: student1)
cherokeeTrail.printFavoriteTeacherInfo(for: student2)
