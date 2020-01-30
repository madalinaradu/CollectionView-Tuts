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
    @IBOutlet var celebrityLevel : UILabel!
    var celebrityInfo:([String:String])?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userImageViewLeft.image = UIImage(named: celebrityInfo!["image"]!)
        userImageViewLeft.layer.masksToBounds = true
        userImageViewLeft.clipsToBounds = true
        userImageViewLeft.layer.cornerRadius = CGFloat(roundf(Float(userImageViewLeft.frame.size.width/2.0)))
        celebrityName.text = celebrityInfo!["name"]
        celebrityLevel.text = celebrityInfo!["level"]
        
    }
    
    
    
}
