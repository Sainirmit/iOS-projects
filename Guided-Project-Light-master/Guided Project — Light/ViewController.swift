//
//  ViewController.swift
//  Guided Project — Light
//
//  Created by Denis Bystruev on 07/12/2017.
//  Copyright © 2017 Denis Bystruev. All rights reserved.
//

import AVFoundation
import UIKit

class ViewController: UIViewController {
    
    var isLightOn = true
    
    @IBAction func buttonPressed(_ sender: Any) {
        isLightOn = !isLightOn
        
        updateView()
    }
    
    func updateView() {
        let device = AVCaptureDevice.default(for: AVMediaType.video)
        
        if let dev = device, dev.hasTorch {
            view.backgroundColor = .black
            do {
                try dev.lockForConfiguration()
                dev.torchMode = isLightOn ? .on : .off
                dev.unlockForConfiguration()
            } catch {
                print(error)
            }
        } else {
            view.backgroundColor = isLightOn ? .white : .black
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateView()
    }

}

