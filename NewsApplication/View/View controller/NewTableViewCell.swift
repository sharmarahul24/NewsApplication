//
//  NewTableViewCell.swift
//  NewsApplication
//
//  Created by R92 on 09/04/24.
//

import UIKit

class NewTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var imageoutlet: UIImageView!
    
    @IBOutlet weak var lb1: UILabel!
    
    
    @IBOutlet weak var lb2: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
