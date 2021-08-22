//
//  SecondViewController.swift
//  Right-on-target
//
//  Created by Nikita Mamaev on 10.08.2021.
//

import UIKit

class SecondViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        print("loadView SecondViewController")
        print("LoadView")
        let versionLabel = UILabel(frame: CGRect(x: 20, y: view.frame.maxY - 20, width: 200, height: 20))
        versionLabel.text = "Версия 1.2"
        self.view.addSubview(versionLabel)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad SecondViewController")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear SecondViewController")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear SecondViewController")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear SecondViewController")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear SecondViewController")
    }
    
    @IBAction func backScreen(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
