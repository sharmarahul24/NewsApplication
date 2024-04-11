//
//  ViewController.swift
//  NewsApplication
//
//  Created by R92 on 08/04/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageoutlet: UIImageView!
    
    @IBOutlet weak var titlelable: UILabel!
    
    @IBOutlet weak var namelable: UILabel!
    
    @IBOutlet weak var dislable: UILabel!
    
    
    var img = UIImage(named: "")
    var namee = ""
    var dis = ""
    var tit = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageoutlet.image = img
        namelable.text = namee
        dislable.text = dis
        titlelable.text = tit
    }


}

