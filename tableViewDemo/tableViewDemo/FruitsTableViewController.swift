//
//  ViewController.swift
//  tableViewDemo
//
//  Created by Peitong Shi on 2/27/18.
//  Copyright © 2018 Peitong Shi. All rights reserved.
//

import UIKit

class FruitsTableViewController:  UITableViewController {
    
    var fruits: [String] = ["Apple", "Banana", "Pineapple"]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let fruit = fruits[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "fruitsCell")!
        cell.textLabel?.text = fruit
        return cell
    }
    
    
}

