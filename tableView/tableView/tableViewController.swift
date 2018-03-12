//
//  tableViewController.swift
//  tableView
//
//  Created by Peitong Shi on 3/10/18.
//  Copyright © 2018 Peitong Shi. All rights reserved.
//

import UIKit


class tableViewController: UITableViewController {
    var checkDetail: Int = 0
    var fps_game: [String] = ["Counter Strike", "Rainbow Six Siege", "PUBG"]
    var selected: String?
    
    
    //this method return the length of the array, indicates how many elements in our array (are going to be shown)
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fps_game.count
    }
   
    @IBOutlet weak var message: UILabel!
    
    @IBOutlet weak var detailButtonTitle: UIButton!
    
    @IBAction func detail(_ sender: UIButton) {
        if checkDetail != 1 {
            detailButtonTitle.setTitle("Done", for: .normal)
            detailButtonTitle.setTitleColor(UIColor.red, for: .normal)
            message.text = "Click Done to finish placing checkmark"
            message.textColor = UIColor.red
            
            checkDetail = 1
        } else {
            checkDetail = 0
            detailButtonTitle.setTitle("✔️", for: .normal)
            message.text = ""
        }
    }
    
    @IBAction func add(_ sender: Any) {
        showInputDialog()
    }
    func showInputDialog() {
        let alertController = UIAlertController(title: "New Game", message: "Please enter the name of new game", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Enter", style: .default) { (_) in
            
            //getting the input values from user
            let name = alertController.textFields?[0].text
            if name != nil {
                self.fps_game.append(name!)
                self.tableView.reloadData()
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Try \"Destiny\""
        }
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        //finally presenting the dialog box
        self.present(alertController, animated: true, completion: nil)

    }
    
    
    
    
    //this method actually create(return) a cell (a view)
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let current_game = fps_game[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "fpsCell") as! fpsCell
        ////we actually know cell will be there, so it is good for us to force wrapping it
        //if we do "let cell = UITableView()" it works, but it will create new instance everytime
        
        cell.textLabel?.text = current_game
        cell.game = current_game
        return cell //the cell has been wrapped, so it can be returned as a UITableViewCell
    }
    
    
    
    
    
    //print when select the column
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selected = fps_game[indexPath.row]
        
        //segue name: fpsTransition. When we select the row, we want to transit to new view controller
        if checkDetail != 1 {
            performSegue(withIdentifier: "fpsTransition", sender: self)
        } else {
        if tableView.cellForRow(at: indexPath)?.accessoryType != UITableViewCellAccessoryType.checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
        }
        }
    }
    
    override func prepare(for segue:UIStoryboardSegue, sender:Any?) {
        if let destination = segue.destination as? DisplayFPSViewController {
            destination.game = selected  //pass the name of game(data) to DisplayFpsViewController
        }
    }
}
