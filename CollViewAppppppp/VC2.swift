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
    
    @IBOutlet var initialsCollectionView: UICollectionView!
    @IBOutlet var userImageViewLeft : UIImageView!
    @IBOutlet var celebrityName: UILabel!
    @IBOutlet var celebrityLevel : UILabel!
    var celebrityInfo:([String:String])?
    let InitialsCollectionViewCellIdentifier = "InitialsCollectionViewCell"
    var initials = [  ["initial":"A","initialimage":"A"], ["initial":"B","initialimage":"B"], ["initial":"C","initialimage":"C"], ["initial":"D","initialimage":"D"], ["initial":"E","initialimage":"E"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initialNibCell = UINib(nibName: InitialsCollectionViewCellIdentifier, bundle: nil)
        initialsCollectionView.register(initialNibCell, forCellWithReuseIdentifier: InitialsCollectionViewCellIdentifier)
        
        userImageViewLeft.image = UIImage(named: celebrityInfo!["image"]!)
        userImageViewLeft.layer.masksToBounds = true
        userImageViewLeft.clipsToBounds = true
        userImageViewLeft.layer.cornerRadius = CGFloat(roundf(Float(userImageViewLeft.frame.size.width/2.0)))
        celebrityName.text = celebrityInfo!["name"]
        celebrityLevel.text = celebrityInfo!["level"]
        
    }
    
    
    
}

extension VC2: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if celebrityInfo!["level"] == "1" {
            return 2
        } else {
            return initials.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let initialsCell = initialsCollectionView.dequeueReusableCell(withReuseIdentifier: InitialsCollectionViewCellIdentifier, for: indexPath) as! InitialsCollectionViewCell
        let initial = initials[indexPath.row]
        initialsCell.initialsImageView.image = UIImage(named: initial["initialimage"] ?? "nothing")
        initialsCell.initialsView.layer.masksToBounds = true
        initialsCell.initialsView.clipsToBounds = true
        initialsCell.initialsView.layer.cornerRadius = CGFloat(roundf(Float(initialsCell.initialsView.frame.size.width/2.0)))
        
        
        return initialsCell
    }
    
    
    
    
    
    
}
