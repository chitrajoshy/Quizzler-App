//
//  Question.swift
//  Quizzler App
//
//  Created by AKASH on 23/07/19.
//  Copyright © 2019 CDNS. All rights reserved.
//

import Foundation

class Question {
    
    var questionText : String
    var answer : Bool
    
    init(text : String, correctAnswer : Bool){
        questionText = text
        answer = correctAnswer
    }
    
}
