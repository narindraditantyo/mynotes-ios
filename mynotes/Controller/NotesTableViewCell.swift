//
//  NotesTableViewCell.swift
//  mynotes
//
//  Created by Narindra Aditantyo on 09/11/20.
//  Copyright © 2020 Narindra Aditantyo. All rights reserved.
//

import UIKit

class NotesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var textTitle: UILabel!
    @IBOutlet weak var textDesc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
