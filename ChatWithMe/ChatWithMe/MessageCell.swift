//
//  MessageCell.swift
//  ChatWithMe
//
//  Created by Rob Hernandez on 2/22/17.
//  Copyright © 2017 Robert Hernandez. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
   

    @IBOutlet weak var messageLabel: UILabel!
    var msg: Message!{
        didSet{
            messageLabel.text = msg.text!
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
