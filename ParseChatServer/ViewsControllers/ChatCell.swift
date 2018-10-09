//
//  ChatCell.swift
//  ParseChatServer
//
//  Created by Jetry Dumont on 10/7/18.
//  Copyright © 2018 Wendy Jean. All rights reserved.
//

import UIKit


class ChatCell: UITableViewCell {

    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
