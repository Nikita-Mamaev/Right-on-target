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
    var round: Int = 1
    var points: Int = 0
    lazy var secondViewController: SecondViewController = getSecondViewController()
    
    override func loadView() {
        super.loadView()
        print("LoadView")
        let versionLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 20))
        versionLabel.text = "Версия 1.1"
        self.view.addSubview(versionLabel)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        number = Int.random(in: 1...50)
        label.text = String(number)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func checkButtonPressed(_ sender: UIButton) {
        checkNumber()
    }
    
    @IBAction func aboutProgram(_ sender: UIButton) {
        showNextScreen()
    }
    
    // приватный метод, загружающий View Controller
    private func getSecondViewController() -> SecondViewController {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let viewController = storyboard.instantiateViewController(identifier: "SecondViewController")
    return viewController as! SecondViewController
    }
    
    func showNextScreen() {
        self.present(secondViewController, animated: true, completion: nil)
    }
    
    //Логика игры
    func checkNumber() {
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
