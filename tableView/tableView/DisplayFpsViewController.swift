//
//  DisplayFpsViewController.swift
//  tableView
//
//  Created by Peitong Shi on 3/10/18.
//  Copyright © 2018 Peitong Shi. All rights reserved.
//

import UIKit

class DisplayFPSViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    var game: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        display.text = game
        icon.image = UIImage(named:game!)
        icon.contentMode = .scaleAspectFit
    }
    
}
