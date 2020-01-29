//
//  ViewController.swift
//  CollViewAppppppp
//
//  Created by Alexandra Radu on 28/01/2020.
//  Copyright © 2020 Alexandra Radu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var addTextField: UITextField!
    @IBOutlet var popupView: UIView!
    @IBOutlet var collectionView: UICollectionView!
    let UserCollectionViewCellIdentifier = "UserCollectionViewCell"
    
//    var users = [UserModel]()
    var celebrities = [
        ["name":"LeBron", "image":"LeBron"], ["name":"Adele","image":"Adele"],
        ["name":"Selena", "image":"Selena"], ["name":"Edd", "image":"Edd"],
        ["name":"Shakira", "image":"Shakira"], ["name":"Bad Bunny","image":"BadBunny"],
        ["name":"Bruno Mars", "image":"BrunoMars"], ["name":"J Balvin", "image":"JBalvin"],
        ["name":"Nina Pastori", "image":"Nina"], ["name":"Alejandro Sanz","image":"Sanz"],
        ["name":"Rihanna", "image":"Rihanna"], ["name":"Maluma", "image":"Maluma"],
        ["name":"Billie Eilish", "image":"Billie"],
        ["name":"LeBron", "image":"LeBron"], ["name":"Adele","image":"Adele"],
        ["name":"Selena", "image":"Selena"], ["name":"Edd", "image":"Edd"],
        ["name":"Shakira", "image":"Shakira"], ["name":"Bad Bunny","image":"BadBunny"],
        ["name":"Bruno Mars", "image":"BrunoMars"], ["name":"J Balvin", "image":"JBalvin"],
        ["name":"Nina Pastori", "image":"Nina"], ["name":"Alejandro Sanz","image":"Sanz"],
        ["name":"Rihanna", "image":"Rihanna"], ["name":"Maluma", "image":"Maluma"],
        ["name":"Billie Eilish", "image":"Billie"],
        ["name":"LeBron", "image":"LeBron"], ["name":"Adele","image":"Adele"],
        ["name":"Selena", "image":"Selena"], ["name":"Edd", "image":"Edd"],
        ["name":"Shakira", "image":"Shakira"], ["name":"Bad Bunny","image":"BadBunny"],
        ["name":"Bruno Mars", "image":"BrunoMars"], ["name":"J Balvin", "image":"JBalvin"],
        ["name":"Nina Pastori", "image":"Nina"], ["name":"Alejandro Sanz","image":"Sanz"],
        ["name":"Rihanna", "image":"Rihanna"], ["name":"Maluma", "image":"Maluma"],
        ["name":"Billie Eilish", "image":"Billie"],
        ["name":"LeBron", "image":"LeBron"], ["name":"Adele","image":"Adele"],
        ["name":"Selena", "image":"Selena"], ["name":"Edd", "image":"Edd"],
        ["name":"Shakira", "image":"Shakira"], ["name":"Bad Bunny","image":"BadBunny"],
        ["name":"Bruno Mars", "image":"BrunoMars"], ["name":"J Balvin", "image":"JBalvin"],
        ["name":"Nina Pastori", "image":"Nina"], ["name":"Alejandro Sanz","image":"Sanz"],
        ["name":"Rihanna", "image":"Rihanna"], ["name":"Maluma", "image":"Maluma"],
        ["name":"Billie Eilish", "image":"Billie"], ["name":"LeBron", "image":"LeBron"], ["name":"Adele","image":"Adele"],
        ["name":"Selena", "image":"Selena"], ["name":"Edd", "image":"Edd"],
        ["name":"Shakira", "image":"Shakira"], ["name":"Bad Bunny","image":"BadBunny"],
        ["name":"Bruno Mars", "image":"BrunoMars"], ["name":"J Balvin", "image":"JBalvin"],
        ["name":"Nina Pastori", "image":"Nina"], ["name":"Alejandro Sanz","image":"Sanz"],
        ["name":"Rihanna", "image":"Rihanna"], ["name":"Maluma", "image":"Maluma"],
        ["name":"Billie Eilish", "image":"Billie"], ["name":"LeBron", "image":"LeBron"], ["name":"Adele","image":"Adele"],
        ["name":"Selena", "image":"Selena"], ["name":"Edd", "image":"Edd"],
        ["name":"Shakira", "image":"Shakira"], ["name":"Bad Bunny","image":"BadBunny"],
        ["name":"Bruno Mars", "image":"BrunoMars"], ["name":"J Balvin", "image":"JBalvin"],
        ["name":"Nina Pastori", "image":"Nina"], ["name":"Alejandro Sanz","image":"Sanz"],
        ["name":"Rihanna", "image":"Rihanna"], ["name":"Maluma", "image":"Maluma"],
        ["name":"Billie Eilish", "image":"Billie"], ["name":"LeBron", "image":"LeBron"], ["name":"Adele","image":"Adele"],
        ["name":"Selena", "image":"Selena"], ["name":"Edd", "image":"Edd"],
        ["name":"Shakira", "image":"Shakira"], ["name":"Bad Bunny","image":"BadBunny"],
        ["name":"Bruno Mars", "image":"BrunoMars"], ["name":"J Balvin", "image":"JBalvin"],
        ["name":"Nina Pastori", "image":"Nina"], ["name":"Alejandro Sanz","image":"Sanz"],
        ["name":"Rihanna", "image":"Rihanna"], ["name":"Maluma", "image":"Maluma"],
        ["name":"Billie Eilish", "image":"Billie"],
        
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // register cell
        let userNibCell = UINib(nibName: UserCollectionViewCellIdentifier, bundle: nil)
        collectionView.register(userNibCell, forCellWithReuseIdentifier: UserCollectionViewCellIdentifier)
        
    }
    
    @IBAction func addItem(_ sender: Any) {
        popupView.isHidden = false
    }
    
    @IBAction func submitPressed(_ sender: Any) {
        let name = addTextField.text
        let dictionaryToAdd = ["name":name, "image":"Generic"]
        celebrities.append(dictionaryToAdd as! [String : String])
        let indexPath = IndexPath(row: celebrities.count - 1, section: 0)
        collectionView.insertItems(at: [indexPath])
        popupView.isHidden = true
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
        cell.imageViewView.layer.masksToBounds = true
        cell.imageViewView.clipsToBounds = true
        cell.imageViewView.layer.cornerRadius = CGFloat(roundf(Float(cell.imageViewView.frame.size.width/2.0)))
        return cell
    }
        
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let celebrity = celebrities[indexPath.row]
        print("\(indexPath.row) - \(celebrity["name"] ?? "Secret")")
        
        let alert = UIAlertController(title: "Warning!", message: "Are you sure you want to delete \(celebrity["name"] ?? "this celebrity")?", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { _ in
            self.collectionView.deleteItems(at: [indexPath])
            self.celebrities.remove(at: indexPath.item)
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))

        self.present(alert, animated: true)
        
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//    
//       return CGSize(width: 110.0, height: 110.0)
//       
//    }
 
 
}

