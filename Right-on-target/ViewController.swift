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
    lazy var secondViewController: SecondViewController = getSecondViewController()
    var game: Game!
    
    override func loadView() {
        super.loadView()
        print("LoadView")
        let versionLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 20))
        versionLabel.text = "Версия 1.2"
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
        game = Game(startValue: 1, endValue: 50, rounds: 5)
        label.text = String(game.currentSecretValue)
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
        game.calculateScore(with: numSlider)
        if game.isGameEnded {
            let alert = UIAlertController(
                title: "Игра окончена",
                message: "Вы заработали \(game.score) очков", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Начать заново", style: .default){
                UIAlertAction in
                self.restartGame()
            })
            present(alert, animated: true, completion: nil)
        } else {
            game.startNewRound()
            label.text = String(game.currentSecretValue)
        }
    }
    
    func restartGame(){
        game.restartGame()
        label.text = String(game.currentSecretValue)
    }
}
