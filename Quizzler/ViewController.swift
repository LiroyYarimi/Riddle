//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
        
    //Place your instance variables here
    let allQuestion = QuestionBank()
    var pickedAnswer : Bool = false
    var questionIndex : Int = 0
    var score : Int = 0
    var numberOfQuestions : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberOfQuestions = allQuestion.getNumberOfQuestions()
        nextQuestion()
        progressLabel.text = "1/\(numberOfQuestions)"
        scoreLabel.text = "Score: 0"
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        
        if sender.tag == 1{
            pickedAnswer = true
        }
        else if sender.tag == 2{
            pickedAnswer = false
        }
        
        checkAnswer()
        questionIndex += 1
        nextQuestion()
        
    }
    
    
    func updateUI() {
      
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionIndex+1) / \(numberOfQuestions)"
        
        progressBar.frame.size.width = (view.frame.size.width) / CGFloat(numberOfQuestions) * CGFloat(questionIndex + 1)
        
    }
    

    func nextQuestion() {
        if questionIndex <= (numberOfQuestions - 1) {
            questionLabel.text = allQuestion.list[questionIndex].questionText
            updateUI()
        }
        else{
            
            /*
            // HOW TO PRINT 3 OPTION
            let alert = UIAlertController(title: "Great", message: "What would you like to do?", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Continue", style: .default) { (UIAelrtAction) in
                print("continue")
            }
            let alertAction2 = UIAlertAction(title: "Exit", style: .default) { (UIAelrtAction) in
                print("exit")
            }
            let alertAction3 = UIAlertAction(title: "cansel", style: .cancel) { (UIAelrtAction) in
                print("cansel")
            }
            alert.addAction(alertAction)
            alert.addAction(alertAction2)
            alert.addAction(alertAction3)
            
            present(alert, animated: true, completion: nil)
            */
            
            // here we want pop up message to the user. Ask him if he want to start over.
            let alert = UIAlertController(title: "Awesome", message: "You've finished all the questions, do you want to start over?", preferredStyle: .alert) // the message
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAelrtAction) in // the option for user
                self.startOver()
            }
            let infoAction = UIAlertAction(title: "Question source", style: .default) { (UIAelrtAction) in
                //performSegue(withIdentifier: "secondeViewInfoViewController", sender: self)}
                self.goToSecondScreen()
                self.startOver()
            }
            alert.addAction(restartAction)
            alert.addAction(infoAction)
            present(alert, animated: true, completion: nil) // present the message
        } // for more inpormation watch lecture 97 again (section 9)
    }
    
    
    func checkAnswer() {
        
        let correctAnswer = allQuestion.list[questionIndex].answer
        
        if pickedAnswer == correctAnswer{
            //print("you got it!")
            ProgressHUD.showSuccess("Correct")
            score += 1
        }
        else{
            //print("wrong!")
            ProgressHUD.showError("Wrong!")
        }
        
    }
    func goToSecondScreen(){
        performSegue(withIdentifier: "goToInfoView", sender: self)
    }
    
    func startOver() {
        
        questionIndex = 0
        score = 0
        nextQuestion()
    }
    

    override var preferredStatusBarStyle: UIStatusBarStyle { //for making the status bar white color
        return .lightContent
    }
}
