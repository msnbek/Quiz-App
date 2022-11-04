//
//  ViewController.swift
//  Quiz App
//
//  Created by Mahmut Şenbek on 2.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
   // var timer = Timer()
    
  var quizBrain = QuizBrain()
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        //let randomVal = quiz.randomElement()
        uptadeUI()
        progressView.progress = 0
        
    }

    @IBAction func answeredQuestion(_ sender: UIButton) {
        
        //progressView.progress = 0
        
       // passedQuestion += 1
        
      //  timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(time), userInfo: nil, repeats: true)
      
        let answeredQuestion = sender.currentTitle! // True False
       let userGotItRıght =  quizBrain.checkAnser(answeredQuestion) //Bool
        
        let userScore = quizBrain.scoreCounting(userSelectedAnswer: answeredQuestion)
        if userScore == true {
            quizBrain.score += 1
           // scoreLabel.text = "Score: \(quizBrain.score)"
        }else {
            quizBrain.score -= 1
            //scoreLabel.text = "Score: \(quizBrain.score)"
        }
        
        if userGotItRıght {
            sender.backgroundColor = .green
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                
                sender.backgroundColor = .black
            }
        
        }else {
            sender.backgroundColor = .red
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                
                sender.backgroundColor = .black
            }
        }
        
        quizBrain.nextQuestion()
   
      
      //  let lastQuestion = sender.currentTitle
       // if lastQuestion == quiz[2][1] {
        //    questionNumber = 0
        // }
       // let randomVal = quiz.randomElement()
        //questionLabel.text = randomVal
        uptadeUI()
    }
    func uptadeUI() {
        questionLabel.text =  quizBrain.getQuestionText()
        progressView.progress =  quizBrain.getProgress()
      scoreLabel.text = "Score: \(quizBrain.score)"
        print(progressView.progress)
        
 
        
    }
    
  
   /* @objc func time() {
        if passedQuestion < totalQuestion {
            
            passedQuestion += 1
            
            print(passedQuestion)
            
            let progress = Float(passedQuestion) / Float(totalQuestion)
            progressView.progress = progress
            print(progress)
         
        }
    }
    */
    
}

