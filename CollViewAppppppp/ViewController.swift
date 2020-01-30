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
    var selectedCell:([String:String])?
    let UserCollectionViewCellIdentifier = "UserCollectionViewCell"
    // add key:  level in dictionary [ 0,1 or 2]
    // alert: delete, continue, cancel
    //continue:
    //level 0 : alert disapear , appear another alert [ Acces deny/ button  okay]
    // level 1,2 : 
    var celebrities = [
        ["name":"LeBron", "image":"LeBron", "level":"1"], ["name":"Adele","image":"Adele", "level":"0"],
        ["name":"Selena", "image":"Selena", "level":"2"], ["name":"Edd", "image":"Edd", "level":"1"],
        ["name":"Shakira", "image":"Shakira", "level":"0"], ["name":"Bad Bunny","image":"BadBunny", "level":"2"],
        ["name":"Bruno Mars", "image":"BrunoMars", "level":"1"], ["name":"J Balvin", "image":"JBalvin", "level":"0"],
        ["name":"Nina Pastori", "image":"Nina", "level":"2"], ["name":"Alejandro Sanz","image":"Sanz", "level":"0"],
        ["name":"Rihanna", "image":"Rihanna", "level":"1"], ["name":"Maluma", "image":"Maluma", "level":"1"],
        ["name":"Billie Eilish", "image":"Billie", "level":"2"]
        
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // register cell
        let userNibCell = UINib(nibName: UserCollectionViewCellIdentifier, bundle: nil)
        collectionView.register(userNibCell, forCellWithReuseIdentifier: UserCollectionViewCellIdentifier)
        
    }
    
    
    //MARK: - methods
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
        addTextField.text = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? VC2 {
            vc.celebrityInfo = self.selectedCell
            
        }
        
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
        
        let alert = UIAlertController(title: "Warning!", message: "Are you sure you want to delete \(celebrity["name"] ?? "this celebrity")?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Delete", style: .default, handler: { _ in
            self.collectionView.deleteItems(at: [indexPath])
            self.celebrities.remove(at: indexPath.item)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { action -> Void in
            self.selectedCell = celebrity
            if celebrity["level"] != "0" {
                self.performSegue(withIdentifier: "goToDetailsPage", sender: self)
                
            } else {
                
                let alert2 = UIAlertController(title: "", message: "Acces Denied", preferredStyle: .alert)
                alert2.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
                self.present(alert2, animated: true)
                
            }
            
        }))
        
        
        self.present(alert, animated: true)
        
    }
    
}

