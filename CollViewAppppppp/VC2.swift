//
//  VC2.swift
//  CollViewAppppppp
//
//  Created by Alexandra Radu on 30/01/2020.
//  Copyright © 2020 Alexandra Radu. All rights reserved.
//

import Foundation
import UIKit

class VC2 : UIViewController {
    @IBOutlet var userImageViewLeft : UIImageView!
    @IBOutlet var celebrityName: UILabel!
    var celebrityInfo:([String:String])?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userImageViewLeft.image = UIImage(named: celebrityInfo!["image"]!)
        celebrityName.text = celebrityInfo!["name"]
        
    }
    
    
    
}
