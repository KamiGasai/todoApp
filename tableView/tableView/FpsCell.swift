//
//  fpsCell.swift
//  tableView
//
//  Created by Peitong Shi on 3/10/18.
//  Copyright © 2018 Peitong Shi. All rights reserved.
//

import UIKit

class fpsCell: UITableViewCell {
    
    @IBOutlet weak var icon: UIImageView!

    var game: String? {
        didSet {
            if let game = game {
                icon.image = UIImage(named: game)
                icon.contentMode = .scaleAspectFit
            }
        }
    }
}
