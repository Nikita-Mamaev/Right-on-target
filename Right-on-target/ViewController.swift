//
//  ViewController.swift
//  Right-on-target
//
//  Created by Nikita Mamaev on 04.08.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var label: UILabel!
    
    var number: Int = 0
    var round: Int = 0
    var points: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func checkNumber() {
        if self.round == 0 {
         self.number = Int.random(in: 1...50)
         self.label.text = String(self.number)
         self.round = 1
        } else {
            let numSlider = Int(self.slider.value.rounded())
            if numSlider > self.number {
            self.points += 50 - numSlider + self.number } else if numSlider < self.number {
            self.points += 50 - self.number + numSlider } else {
            self.points += 50 }
        }
    }
}
