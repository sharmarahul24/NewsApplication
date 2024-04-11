//
//  DidselectViewController.swift
//  NewsApplication
//
//  Created by R92 on 11/04/24.
//

import UIKit

class DidselectViewController: UIViewController {

    @IBOutlet weak var imageoutlet: UIImageView!
    
    @IBOutlet weak var titlelable: UILabel!
    
    @IBOutlet weak var namelable: UILabel!
    
    @IBOutlet weak var dislable: UILabel!
    
    
    var imge = UIImage(named: "")
    var author = ""
    var disc = ""
    var titl = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageoutlet.image = imge
        namelable.text = author
        dislable.text = disc
        titlelable.text = titl
    }

  
}
