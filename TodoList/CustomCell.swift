//
//  CustomCell.swift
//  TodoList
//
//  Created by Mike on 4/9/17.
//  Copyright © 2017 Mike. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var NewCategory: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
