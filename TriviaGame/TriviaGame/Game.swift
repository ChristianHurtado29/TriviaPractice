//
//  Game.swift
//  TriviaGame
//
//  Created by Alex Paul on 10/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

  // TODO: write the following properties
class Game {
    // MARK: properties of Game
    
  // 1. a questions array property [Question]
  // >> instance property
  var questions = [Question]()
  // 2. a score property
  var score = 0 // this is a stored property
  // 3. a total questions property
    // keeps track of total questions asked to the user
  var totalQuestions = 0
    
    //this is an instance of a computed property
    // e.g game.hasMoreQuestions, return true or false
  var hasMoreQuestions: Bool {
    // accessors available in Swift are getters and setters
    // using the not ! symbol to negate or toggle the current value
    return !questions.isEmpty
    }
  
    // illustrations purposes to demonstrate using computed property to return a full name
//    let firstName = "Alex"
//    let lastName = "Paul"
//    var fullName: String {
//        return firstName + " " + lastName
    
    
  // MARK: methods of Game
  // write the following methods
  // 1. write a method to get a shuffled question
  //    remove the question from the questions array above
func getQuestion() -> Question? {
    // shuffle the array
    questions = questions.shuffled()
    // popLast removes the last element and returns it
    return questions.popLast()
    }

  // 2. write a method to start the Game, this method
  //    creates the array of questions [Question]
    func createQuestions(_ triviaType: TriviaType) {
        // step 1 - loop through the array (TriviaData.data)
        for dict in Trivia.data {
            // step 2 - using the key "trivia type" in the dictionary, we need to access the value
            if let unwrappedTriviaType = dict["triviaType"] as? String {
            // step 3 - compare the trivia type the user entered with the current trivia type in the dictionary
            if unwrappedTriviaType == triviaType.rawValue {
            // step 4 - create a Question and append to the questions array
                // step 5 - unwrap question and add to array
                if let question = Question(dict: dict) {
                    questions.append(question)
                
                }
            }
        }
        }
        totalQuestions = questions.count
        print("\(questions.count) was created")
    }
  // 3. write a method to check if the answer is correct
  //    and increment the score by 1 
    func checkAnswer(usersAnswer: String, question: Question){
        if usersAnswer == question.correctAnswer {
            // increment the score by 1
            score += 1
            print("Correct answer. \n \(question.fact)")
        } else {
            print("Wrong answer. \n\(question.fact)")
        }
    }
   // 4. Write a method that prints out the final score and total of questions.
    func finalScore() {
        print("Thanks for playing trivia, your score is \(score) out of \(totalQuestions)")
    }
    
    // 5. Write a method that resets the game if the player wishes to continue
    func reset() {
        score = 0
        questions.removeAll()
        
    }
    //Write a method that takes in the users choice of trivia e.g "1" to play movie trivia
    
    // revisit function parameter names
    // internal parameter name
    func selectTrivia(_ userResponse: String) { // "1"..."4"
        switch userResponse {
        case "1":
            createQuestions(.movieTrivia)
        case "2":
            createQuestions(.sportsTrivia)
        case "3":
            createQuestions(.musicTrivia)
        case "4":
            createQuestions(.nycTrivia)
        default:
            print("Trivia type is unavailable")
        }
        
    }
}
