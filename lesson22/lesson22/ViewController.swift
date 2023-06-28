//
//  ViewController.swift
//  lesson22
//
//  Created by Volodymyr Rykhva on 28.08.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let testEngine = Engine(cylindersCount: 8)
        let testCar = Car(engine: testEngine, model: "test car")
        testCar.ride(with: 50)

        longTestFunc()
    }

    func longTestFunc() {
        (0...1000000).forEach { (el) in
            print(el)
        }
    }
}

