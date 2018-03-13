//
//  fpsModel.swift
//  tableView
//
//  Created by Peitong Shi on 3/13/18.
//  Copyright © 2018 Peitong Shi. All rights reserved.
//

import UIKit

class fpsModel {
    var fps_game:[String]?
    let defaults = UserDefaults.standard
    
    init() {
        if let array = defaults.array(forKey: "game") as? [String] {
            fps_game = array
        } else {
            fps_game = [""]
        }
    }
    
    
    
    func saveData() {
        defaults.set(fps_game, forKey:"game")
    }
    
    func loadData() {
        fps_game = defaults.array(forKey: "game") as? [String]
    }
    
}
