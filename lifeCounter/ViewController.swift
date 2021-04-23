//
//  ViewController.swift
//  lifeCounter
//
//  Created by 曾畅 on 2021/4/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var life1: UILabel!
    @IBOutlet weak var life2: UILabel!
    @IBOutlet weak var life3: UILabel!
    @IBOutlet weak var life4: UILabel!
    @IBOutlet weak var loser: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func changeValue (val: Int, target: Int) {
    switch target {
    case 1:
    let lifeTotal = Int(life1.text!)!
    let newTotal = lifeTotal + val
    life1.text = String(newTotal)
    if (newTotal <= 0){
        loser.text = "Player 1 LOSES!"
    }
    case 2:
    let lifeTotal = Int(life2.text!)!
    let newTotal = lifeTotal + val
    life2.text = String(newTotal)
    if (newTotal <= 0){
        loser.text = "Player 2 LOSES!"
    }
    case 3:
    let lifeTotal = Int(life3.text!)!
    let newTotal = lifeTotal + val
    life3.text = String(newTotal)
    if (newTotal <= 0){
        loser.text = "Player 3 LOSES!"
    }
    case 4:
    let lifeTotal = Int(life4.text!)!
    let newTotal = lifeTotal + val
    life4.text = String(newTotal)
    if (newTotal <= 0){
        loser.text = "Player 4 LOSES!"
    }
    default:
        print("Reached the unreacable")
    }
    }
    
    @IBAction func negFive1(_ sender: Any) {
        changeValue(val: -5, target: 1)
    }
    @IBAction func negOne1(_ sender: Any) {
        changeValue(val: -1, target: 1)
    }
    @IBAction func one1(_ sender: Any) {
        changeValue(val: 1, target: 1)
    }
    @IBAction func five1(_ sender: Any) {
        changeValue(val: 5, target: 1)
    }
    
    
    @IBAction func negFive2(_ sender: Any) {
        changeValue(val: -5, target: 2)
    }
    @IBAction func negOne2(_ sender: Any) {
        changeValue(val: -1, target: 2)
    }
    @IBAction func one2(_ sender: Any) {
        changeValue(val: 1, target: 2)
    }
    @IBAction func five2(_ sender: Any) {
        changeValue(val: 5, target: 2)
    }
    
    @IBAction func negFive3(_ sender: Any) {
        changeValue(val: -5, target: 3)
    }
    @IBAction func negOne3(_ sender: Any) {
        changeValue(val: -1, target: 3)
    }
    @IBAction func one3(_ sender: Any) {
        changeValue(val: 1, target: 3)
    }
    @IBAction func five3(_ sender: Any) {
        changeValue(val: 5, target: 3)
    }
    
    @IBAction func negFive4(_ sender: Any) {
        changeValue(val: -5, target: 4)
    }
    @IBAction func negOne4(_ sender: Any) {
        changeValue(val: -1, target: 4)
    }
    @IBAction func one4(_ sender: Any) {
        changeValue(val: 1, target: 4)
    }
    @IBAction func five4(_ sender: Any) {
        changeValue(val: 5, target: 4)
    }
}

