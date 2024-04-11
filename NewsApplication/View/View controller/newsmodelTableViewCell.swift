//
//  newsmodelTableViewCell.swift
//  NewsApplication
//
//  Created by R92 on 08/04/24.
//

import UIKit

class newsmodelTableViewCell: UITableViewCell {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var lb1: UILabel!
    @IBOutlet weak var titlelable: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
