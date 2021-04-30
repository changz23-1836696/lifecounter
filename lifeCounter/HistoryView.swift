//
//  HistoryView.swift
//  lifeCounter
//
//  Created by Chang Zeng on 4/29/21.
//

import UIKit

class HistoryView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
   
    @IBOutlet weak var historyView: UITableView!
    let cellReuseIdentifier = "historyCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.historyView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        historyView.delegate = self
        historyView.dataSource = self
    }
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return history.count }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.historyView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath) as UITableViewCell
        //text in each cell
        cell.textLabel?.text = "\(history[history.count - indexPath.row - 1])"
        
        return cell
    }
}
