//
//  main.swift
//  TriviaGame
//
//  Created by Alex Paul on 10/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

let game = Game()

var playAgain = false

repeat{
    
let userPrompt = """
    Select the type of Trivia you would like to play
    1. Movie Trivia
    2. Sports Trivia
    3. Music Trivia
    4. NYC Trivia
    """
    print(userPrompt)
    let userResponse = readLine() ?? ""
    
    game.selectTrivia(userResponse)
    
    repeat{
        guard let question = game.getQuestion() else{
            break
        }
        print(question.questionPrompt)
        print(question.choices)
        let userAnswer = readLine() ?? ""
        game.checkAnswer(usersAnswer: userAnswer, question: question)
        
    } while game.hasMoreQuestions
    
    game.finalScore()
    game.reset()
    
    print("Would you like to play again?")
    var userAgain = readLine() ?? ""
    if userAgain == "yes" {
        game.reset()
        playAgain = true
    }
    else{
        playAgain = false
        print("Peace out!")}
} while playAgain
