//
//  ViewController.swift
//  AccessibilityDemo
//
//  Created by William Biondi on 20/05/2019.
//  Copyright © 2019 William Biondi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var divisorLabel: UITextView!
    @IBOutlet weak var numberField: UITextField!
    
    var bgTask: UIBackgroundTaskIdentifier = UIBackgroundTaskIdentifier.invalid
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func calculateTap(_ sender: Any) {
        divisorLabel.text = ""
        if let n = Int(numberField.text!) as? Int{
            calculateDivisors(number: n)
        }
        
   
    }
    
    func calculateDivisors(number:Int){
        DispatchQueue.global(qos: .userInitiated).async {
            for nDivisor in stride(from: 1, to: number/2+1, by: 1){
                if number % nDivisor == 0 {
                    DispatchQueue.main.async {
                        self.divisorLabel.text = (self.divisorLabel.text ?? "") + String(nDivisor)+", "
                    }
                }
            }
            
        }
    }
    
}

