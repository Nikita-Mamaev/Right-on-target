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
    
    @IBAction func checkButtonPressed(_ sender: UIButton) {
        checkNumber()
    }
    
    //Логика игры
    func checkNumber() {
        if round == 0{
            number = Int.random(in: 1...50)
            label.text = String(number)
            round = 1
        } else {
            let numSlider = Int(slider.value.rounded())
            if numSlider > number {
                points += 50 - numSlider + number
            } else if numSlider < number {
                self.points += 50 - number + numSlider
            } else {
                points += 50
            }
            if self.round == 5 {
                let alert = UIAlertController(
                    title: "Игра окончена",
                    message: "Вы заработали \(self.points) очков", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
                round = 1
                points = 0
            } else {
                round += 1
            }
            number = Int.random(in: 1...50)
            label.text = String(self.number)
        }
    }
}
