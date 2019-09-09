//
//  TableViewCell.swift
//  ToDoApp
//
//  Created by XCodeClub on 2019-09-04.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var dateLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }



}
