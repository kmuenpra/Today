//
//  ViewController.swift
//  Today
//
//  Created by Macboy on 6/24/21.
//

import UIKit

class ViewController: UIViewController {
    
    

    @IBOutlet weak var usernames: UILabel!
    
    @IBOutlet weak var profilePic: UIImageView!
    
    //Define "made up" username
    
    let name1 = "Orlando Hoillet"
    let name2 = "Akio Fujita"
    let name3 = "Ally Pickering"
    let name4 = "Kasidit Muenprasitivej"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func findMatch(_ sender: Any) {
        
        let n = Int.random(in: 1...4)
        
        if (n == 1) {
            usernames.text = name1;
            profilePic.image = UIImage()
            
        } else if (n == 2) {
            usernames.text = name2;
            
        } else if (n == 3) {
            usernames.text = name3;
            
        } else if (n == 4) {
            usernames.text = name4;
        }
        
        
    }
    

}

