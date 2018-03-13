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
//    var fps_game: [String] = ["Counter Strike", "Rainbow Six Siege", "PUBG"]
    var selected: String?
    var game = fpsModel()
    var finishAdd: Int = 0
    

    
    //this method return the length of the array, indicates how many elements in our array (are going to be shown)

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let counter = game.fps_game {
            return counter.count
        } else {
            return 0
        }
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
    
    func adding() {
        
    }

    
    
    @IBAction func add(_ sender: Any) {
        showInputDialog()
    }
    
    
    func showInputDialog() {
        let alertController = UIAlertController(title: "Add New Game", message: "Enter the name of your game", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "OK", style: .default) { (_) in
            
            //getting the input values from user
            let name = alertController.textFields?[0].text
            if name != nil {
                self.game.fps_game?.append(name!)
                self.tableView.reloadData()
                self.game.saveData()
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        alertController.addTextField { (textField) in
            textField.placeholder = " \"Destiny\", \"Counter Strike\", \"Rainbow Six Siege\""
        }
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        
        //finally presenting the dialog box
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    //this method actually create(return) a cell (a view)
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let current_game = game.fps_game![indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "fpsCell") as! fpsCell
        ////we actually know cell will be there, so it is good for us to force wrapping it
        //if we do "let cell = UITableView()" it works, but it will create new instance everytime
        
        cell.textLabel?.text = current_game
        cell.game = current_game
        return cell //the cell has been wrapped, so it can be returned as a UITableViewCell
    }
    
    
    
    
    
    //print when select the column
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selected = game.fps_game![indexPath.row]
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
    
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObjectTmp = game.fps_game![sourceIndexPath.item]
        game.fps_game?.remove(at: sourceIndexPath.item)
        game.fps_game?.insert(movedObjectTmp, at: destinationIndexPath.item)
        game.saveData()
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            game.fps_game?.remove(at: indexPath.item)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        game.saveData()
    }
    
    @IBAction func edit(_ sender: UIBarButtonItem) {
        self.tableView.isEditing = !self.tableView.isEditing
        sender.title = (self.tableView.isEditing) ? "Done": "Edit"
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
//        game.saveData()
        game.loadData()
        tableView.reloadData()
    }

}
