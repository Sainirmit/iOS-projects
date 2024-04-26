//
//  IntroVC.swift
//  PersonalityQuiz
//
//  Created by Yoon Kwak on 11/3/20.
//  Copyright © 2020 Yoon Kwak. All rights reserved.
//

import UIKit

class IntroVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startQuizPressed(_ sender: Any) {
        performSegue(withIdentifier: "startQuiz", sender: nil)
    }
    
    @IBAction func unwindToIntroVc(segue: UIStoryboardSegue) {}
    
}
