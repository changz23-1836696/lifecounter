//
//  ViewController.swift
//  lifeCounter
//
//  Created by Chang Zeng on 2021/4/22.
//

import UIKit

var history : [String] = []

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //meet picker req
    //number of components
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //number of col
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return players.count
    }
    //tiltes of picker
   func pickerView(_ pickerView: UIPickerView,
                 titleForRow num: Int,
                 forComponent component: Int) -> String {return players[num]}
    //store picked name
    func pickerView(_ pickerView: UIPickerView,
                didSelectRow row: Int,
                inComponent component: Int){ picked = row}
    
    //meet table view req
    //number of rows in table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count;
    }
    //cols in table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : tableCell =
            self.table.dequeueReusableCell(withIdentifier: "Table Cell") as! tableCell
        cell.playerName.text = self.players[indexPath.row]
        cell.playerLife.text = String(self.lifes[indexPath.row])
        return cell
    }
    //tapping the cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tablePicked = indexPath.row
        
        //gather new name
        let alert = UIAlertController(title: "Change Player Name", message: "Change name for \(players[tablePicked]) ...", preferredStyle: .alert)
        // Add Text Field
        alert.addTextField { (textField) in textField.placeholder = "New Player Name" }
        //Buttons
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let updatedPlayerName = alert!.textFields![0]
            self.editName(cellNum: self.tablePicked, newName: updatedPlayerName.text!)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in return }))
        
        self.present(alert, animated: true, completion: nil)
    }

    var players : [String] = ["Player 1", "Player 2", "Player 3", "Player 4"]
    var lifes : [Int] = [20, 20, 20, 20]
    var picked : Int  = 0
    var tablePicked : Int = -1


    @IBOutlet weak var add: UIButton!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var multiplier: UITextField!
    @IBOutlet weak var status: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
        picker.delegate = self
        picker.dataSource = self
    }
    
    //add player button pressed
    @IBAction func addPlayerButton(_ sender: Any) {
        if players.count <= 7{
        //create alert
        let alert = UIAlertController(title: "Add Player", message: "", preferredStyle: .alert)
        alert.addTextField { (textField) in textField.placeholder = "New Player Name" }
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { action in
            //extract user input
            let newPlayer = alert.textFields![0]
            //add new player
            self.players.append(newPlayer.text!)
            self.lifes.append(20)
            //reload data on the view
            self.table.reloadData()
            //reload data on the picker
            self.picker.reloadAllComponents()
            history.append("\(newPlayer.text!) joined the game")
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in return }))
        self.present(alert, animated: true, completion: nil)
        } else {
            add.isEnabled = false
        }
    }
    
    @IBAction func changeLifes(_ sender: UIButton) {
        self.add.isEnabled = false
        var multiplyNumber : Int = 1
        var mark : String = "gained"
        if sender.tag == 0 {
            multiplyNumber = -1
            mark = "lost"
        }
        multiplyNumber = Int(self.multiplier.text!)! * multiplyNumber
        var selected : Int = self.picked
        lifes[selected] += multiplyNumber
        history.append("\(players[selected]) \(mark) life, (now \(lifes[selected]) life)")
        if lifes[selected] <= 0 {
            history.append("\(players[selected]) has lost")
            self.status.text = "Game Over!"
        }
        table.reloadData()
    }
    
    
    @IBAction func reset(_ sender: Any) {
        self.players = ["Player 1", "Player 2", "Player 3", "Player 4"]
        self.lifes = [20, 20, 20, 20]
        self.picked = 0
        self.table.reloadData()
        self.picker.reloadAllComponents()
        self.status.text = "Gaming"
        self.add.isEnabled = true
        history = []
    }
    
    func editName(cellNum : Int, newName : String) {
        history.append("\(players[cellNum]) change name to \(newName)")
        players[cellNum] = newName
        
        table.reloadData()
        picker.reloadAllComponents()
    }
    
}



