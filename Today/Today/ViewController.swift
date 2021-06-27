//
//  ViewController.swift
//  Today
//
//  Created by Macboy on 6/24/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    //IB Outlet
    @IBOutlet weak var usernames: UILabel!
    
    @IBOutlet weak var profilePic: UIImageView!
    
    @IBOutlet weak var clock: UILabel!
    
    @IBOutlet weak var findMatch: UIButton!
    
    @IBOutlet weak var interactive: UIImageView!
    
    @IBOutlet weak var skip: UIButton!
    
    //Define made-up username
    let name1 = "Orlando Hoillet"
    let name2 = "Akio Fujita"
    let name3 = "Ally Pickering"
    let name4 = "Kasidit Muenprasitivej"
    
    // Define countDown for Timer function
    var countDown = Timer();
    var hrs = 0;
    var min = 0;
    var sec = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Hide Call/Chat feature when the user doesn't have a match yet
        interactive.isHidden = true;
        
        //Hide the timer when the user doesn't have a match yet
        clock.isHidden = true;
        
        //Hide made-up username when the user doesn't have a match yet
        usernames.isHidden = true;
        
        //Hide "skip" button
        skip.isHidden = true;
    }
    
    
    //User click on the "Find Random Match" button.
    @IBAction func findMatch(_ sender: Any) {
        
        //reveal the username
        usernames.isHidden = false;
        
        //randomly match user with other users
        let n = Int.random(in: 1...4)
        
        if (n == 1) {
            usernames.text = name1;
            profilePic.image = UIImage(named: "Garfiel");
            
        } else if (n == 2) {
            usernames.text = name2;
            profilePic.image = UIImage(named: "Steve");
            
        } else if (n == 3) {
            usernames.text = name3;
            profilePic.image = UIImage(named: "Katara");
            
        } else if (n == 4) {
            usernames.text = name4;
            profilePic.image = UIImage(named: "default");
        }
    
        //Start Timer function
        countDown = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.counter), userInfo: nil, repeats: true)
        
        //Hide the "Find Random Match" button
        findMatch.isHidden = true;
        
        //Show Call/Chat feature
        interactive.isHidden = false;
        
        //Show the time user has left with their match
        clock.isHidden = false;
        
        //Show "skip" button
        skip.isHidden = false;
        
        //Set duration to 30 seconds
        hrs = 23;
        min = 59
        sec = 60;
    }
    
    
    @objc func counter () {
        
        //Decrement one second
        sec -= 1;
        
        //Display the time onto "clock" label
        clock.text = "Time remaining: " + String(hrs) + ":" + String(min) + ":" + String(sec);

        if (min == 0 && sec == 0) {
            hrs -= 1;
            min = 59;
            sec = 59;
        }
        
        if (sec == 0) {
            min -= 1;
            sec = 59;
        }
        
        
        //If the time ran out
        if (hrs == 0 && min == 0 && sec == 0) {
            //Stop the Timer function
            countDown.invalidate();
            
            //Show the "Find Random Match" button again
            findMatch.isHidden = false;
            //Hide Call/Chat feature
            interactive.isHidden = true;
            //Hide Timer
            clock.isHidden = true;
            //Hide username text
            usernames.isHidden = true;
            //Change Profile picture to default
            profilePic.image = UIImage(named: "default");
            //Hide "skip" button
            skip.isHidden = true;
            
            
        }
        
    }
    
    @IBAction func skipCountDown(_ sender: Any) {
        //Stop the Timer function
        countDown.invalidate();
        
        //Show the "Find Random Match" button again
        findMatch.isHidden = false;
        //Hide Call/Chat feature
        interactive.isHidden = true;
        //Hide Timer
        clock.isHidden = true;
        //Hide username text
        usernames.isHidden = true;
        //Change Profile picture to default
        profilePic.image = UIImage(named: "default");
        //Hide "skip" button
        skip.isHidden = true;
    }
    
}

