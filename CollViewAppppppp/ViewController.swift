//
//  ViewController.swift
//  CollViewAppppppp
//
//  Created by Alexandra Radu on 28/01/2020.
//  Copyright © 2020 Alexandra Radu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    let UserCollectionViewCellIdentifier = "UserCollectionViewCell"
    
//    var users = [UserModel]()
    var celebrities = [
        ["name":"LeBron James", "image":"LeBron"], ["name":"LeBron James","image":"LeBron"],
        ["name":"LeBron James", "image":"LeBron"], ["name":"LeBron James", "image":"LeBron"],
        ["name":"LeBron James", "image":"LeBron"], ["name":"LeBron James","image":"LeBron"],
        ["name":"LeBron James", "image":"LeBron"], ["name":"LeBron James", "image":"LeBron"],
        ["name":"LeBron James", "image":"LeBron"], ["name":"LeBron James","image":"LeBron"],
        ["name":"LeBron James", "image":"LeBron"], ["name":"LeBron James", "image":"LeBron"],
        ["name":"LeBron James", "image":"LeBron"], ["name":"LeBron James","image":"LeBron"],
        ["name":"LeBron James", "image":"LeBron"], ["name":"LeBron James", "image":"LeBron"],
        ["name":"LeBron James", "image":"LeBron"], ["name":"LeBron James","image":"LeBron"],
        ["name":"LeBron James", "image":"LeBron"], ["name":"LeBron James", "image":"LeBron"],
        ["name":"LeBron James", "image":"LeBron"], ["name":"LeBron James","image":"LeBron"],
        ["name":"LeBron James", "image":"LeBron"], ["name":"LeBron James", "image":"LeBron"],
        ["name":"Nina", "image":"Nina"], ["name":"Nina", "image":"Nina"], ["name":"Nina", "image":"Nina"],
        ["name":"Nina", "image":"Nina"], ["name":"Nina", "image":"Nina"], ["name":"Nina", "image":"Nina"],
        ["name":"Nina", "image":"Nina"], ["name":"Nina", "image":"Nina"], ["name":"Nina", "image":"Nina"],
        ["name":"Nina", "image":"Nina"], ["name":"Nina", "image":"Nina"], ["name":"Nina", "image":"Nina"],
        ["name":"Nina", "image":"Nina"], ["name":"Nina", "image":"Nina"], ["name":"Nina", "image":"Nina"],
        ["name":"Nina", "image":"Nina"], ["name":"Nina", "image":"Nina"], ["name":"Nina", "image":"Nina"],
        ["name":"Nina", "image":"Nina"], ["name":"Nina", "image":"Nina"], ["name":"Nina", "image":"Nina"],
        ["name":"Nina", "image":"Nina"], ["name":"Nina", "image":"Nina"], ["name":"Nina", "image":"Nina"],
        ["name":"Nina", "image":"Nina"], ["name":"Nina", "image":"Nina"], ["name":"Nina", "image":"Nina"],
        ["name":"J Balvin", "image":"JBalvin"], ["name":"J Balvin", "image":"JBalvin"], ["name":"J Balvin", "image":"JBalvin"], ["name":"J Balvin", "image":"JBalvin"], ["name":"J Balvin", "image":"JBalvin"], ["name":"J Balvin", "image":"JBalvin"], ["name":"J Balvin", "image":"JBalvin"], ["name":"J Balvin", "image":"JBalvin"], ["name":"J Balvin", "image":"JBalvin"], ["name":"J Balvin", "image":"JBalvin"], ["name":"J Balvin", "image":"JBalvin"], ["name":"J Balvin", "image":"JBalvin"], ["name":"J Balvin", "image":"JBalvin"], ["name":"J Balvin", "image":"JBalvin"], ["name":"J Balvin", "image":"JBalvin"], ["name":"J Balvin", "image":"JBalvin"], ["name":"J Balvin", "image":"JBalvin"], ["name":"J Balvin", "image":"JBalvin"], ["name":"J Balvin", "image":"JBalvin"], ["name":"J Balvin", "image":"JBalvin"], ["name":"J Balvin", "image":"JBalvin"], ["name":"J Balvin", "image":"JBalvin"], ["name":"J Balvin", "image":"JBalvin"], ["name":"J Balvin", "image":"JBalvin"], ["name":"J Balvin", "image":"JBalvin"],


    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // register cell
        let userNibCell = UINib(nibName: UserCollectionViewCellIdentifier, bundle: nil)
        collectionView.register(userNibCell, forCellWithReuseIdentifier: UserCollectionViewCellIdentifier)
        
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return celebrities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserCollectionViewCellIdentifier, for: indexPath) as! UserCollectionViewCell
        let celebrity = celebrities[indexPath.row]
        cell.nameLabel.text = celebrity["name"]
        cell.imageView.image = UIImage(named: celebrity["image"]!)
        return cell
    }
        
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let celebrity = celebrities[indexPath.row]
        print("\(indexPath.row) - \(celebrity["name"] ?? "Secret")")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150.0, height: 150.0)
    }
    
    
}

