//
//  tableViewController.swift
//  tableView
//
//  Created by Peitong Shi on 3/10/18.
//  Copyright © 2018 Peitong Shi. All rights reserved.
//

import UIKit


class tableViewController: UITableViewController {
    
    var fps_game: [String] = ["Counter Strike", "Rainbow Six Siege", "PUBG"]
    
    //this method return the length of the array, indicates how many elements in our array (are going to be shown)
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fps_game.count
    }
   
    
    
    
    
    @IBAction func add(_ sender: Any) {
        fps_game.append("NEW GAME")
        tableView.reloadData()
    }
    
    
    
    //this method actually create(return) a cell (a view)
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let current_game = fps_game[indexPath.row]
        //we actually know cell will be there, so it is good for us to force wrapping it
        let cell = tableView.dequeueReusableCell(withIdentifier: "fpsCell") as! fpsCell
        //if we do "let cell = UITableView()" it works, but it will create new instance everytime
        
        cell.textLabel?.text = current_game
        cell.game = current_game
        
        return cell //the cell has been wrapped, so it can be returned as a UITableViewCell
    }
    
    
    
    
    
    //print when select the column
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(fps_game[indexPath.row])
        
        //segue name: fpsTransition. When we select the row, we want to transit to new view controller
        performSegue(withIdentifier: "fpsTransition", sender: self)
    }
    
//    override func prepare(for segue:UIStoryboardSegue, sender:Any?) {
//        if let destination = segue.destination as? DisplayFPSViewController {
//            destination.display.text 
//        }
//    }
}
