//
//  ScrollDemoCell.swift
//  AlamofireDemo
//
//  Created by ispl Mac Mini on 8/9/17.
//  Copyright © 2017 infinium. All rights reserved.
//

import UIKit

class ScrollDemoCell: UITableViewCell {

    @IBOutlet var txtData: UITextView!
    @IBOutlet var btnAdd: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
