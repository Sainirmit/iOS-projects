//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Yoon Kwak on 11/3/20.
//  Copyright © 2020 Yoon Kwak. All rights reserved.
//

import UIKit

class ResultsVC: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultDefinition: UILabel!
    
    var responses: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResults()
        navigationItem.hidesBackButton = true
    }
    
    func calculatePersonalityResults() {
        var frequencyOfAnswers: [AnimalType: Int] = [:]
        
        let responseType = responses.map { $0.type }
        
        for response in responseType {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1
        }
        
        let frequentAnswersSorted = frequencyOfAnswers.sorted { (pair1, pair2) -> Bool in
            return pair1.value > pair2.value
        }
        
        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1 }.first!.key
        
        resultLabel.text = "You are a \(mostCommonAnswer.rawValue)"
        resultDefinition.text = mostCommonAnswer.definition
        
    }

}
