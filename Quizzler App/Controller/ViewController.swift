//
//  ViewController.swift
//  Quizzler App
//
//  Created by AKASH on 23/07/19.
//  Copyright © 2019 CDNS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestion = QuestionBank()
    var score : Int = 0
    var questionNumber : Int = 0
    var pickedAnswer : Bool = true
    
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var lblProgress: UILabel!
    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet weak var vwProgress: UIView!
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstQuestion = allQuestion.list[0]
        lblQuestion.text = firstQuestion.questionText
        
    }

    @IBAction func answerPressed(_ sender: UIButton) {
        
        if sender.tag == 1 {
            pickedAnswer = true
        } else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()
        questionNumber += 1
        nextQuestion()
   
        
    }
    
    func checkAnswer() {
        
        let correctAnswer = allQuestion.list[questionNumber].answer
        if correctAnswer == pickedAnswer {
            print("Correct")
            score += 1
            lblScore.text = "Score :\(score) / 10"
        } else {
            print("Wrong")
        }
    }
    
    func nextQuestion() {
        if questionNumber <= 9 {
        lblQuestion.text = allQuestion.list[questionNumber].questionText
        updateUI()
        } else {
            print("Quiz completed")
            
            let alert = UIAlertController(title: "Quiz Completed", message: "Do you want to continue ?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Continue", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
            
          
        }
    }
    func updateUI() {
        lblProgress.text = "\(questionNumber + 1)/10"
        lblScore.text = "Score : \(score)/10"
        vwProgress.frame.size.width = (view.frame.size.width/10) * CGFloat(questionNumber + 1)
   
    }
    
    func startOver() {
        questionNumber = 0
        score = 0
        nextQuestion()
    }
}

