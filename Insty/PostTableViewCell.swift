//
//  PostTableViewCell.swift
//  Insty
//
//  Created by Savannah McCoy on 6/21/16.
//  Copyright © 2016 Savannah McCoy. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class PostTableViewCell: UITableViewCell {

    
    
    
    
    @IBOutlet weak var photoPFImageView: PFImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    

    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        // Initialization code
    }

        
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
