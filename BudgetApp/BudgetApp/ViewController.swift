//
//  ViewController.swift
//  BudgetApp
//
//  Created by Danielle Molinar on 4/1/18.
//  Copyright © 2018 Danielle Molinar. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer!
    var checkings:Double = 0;
    var savings:Double = 0;
    var utilities:Double = 0;
    var car:Double = 0;
    var insurance:Double = 0;
    var memberships:Double = 0;
    var food:Double = 0;
    var entertainment:Double = 0;
    var other:Double = 0;
    var total:Double = 0;
    var bills:Double = 0;
    var left:Double = 0;
    
    @IBOutlet weak var saveLabel: UILabel!
    
    @IBOutlet weak var checkLabel: UILabel!
    
    @IBOutlet weak var qLabel: UILabel!
    
    @IBOutlet weak var qqlabel: UILabel!
        
    @IBOutlet weak var rentLabel: UILabel!
    
    @IBOutlet weak var utilitiesLabel: UILabel!
    
    @IBOutlet weak var carLabel: UILabel!
    
    @IBOutlet weak var insuranceLabel: UILabel!
    
    @IBOutlet weak var foodLabel: UILabel!
    
    @IBOutlet weak var entertainmentLabel: UILabel!
    
    @IBOutlet weak var otherLabel: UILabel!
    
    @IBOutlet weak var membershipsLabel: UILabel!
    
    @IBOutlet weak var myCheckings: UITextField!
    
    @IBOutlet weak var mySavings: UITextField!
    
    @IBOutlet weak var myRent: UITextField!
    
    @IBOutlet weak var myUtilites: UITextField!
    
    @IBOutlet weak var myCar: UITextField!
    
    @IBOutlet weak var myInsurance: UITextField!
    
    @IBOutlet weak var myMemberships: UITextField!
    
    @IBOutlet weak var myFood: UITextField!
    
    @IBOutlet weak var myEntertainment: UITextField!
    
    @IBOutlet weak var myOther: UITextField!
    
    @IBOutlet weak var checkingsLeft: UILabel!
    
    @IBOutlet weak var billsSpent: UILabel!
    
    @IBOutlet weak var error: UILabel!
    
    @IBOutlet weak var message: UILabel!
    
    @IBOutlet weak var myImage: UIImageView!
    
    @IBOutlet weak var dollar: UIImageView!
    
    @IBOutlet weak var coin: UIImageView!
   
    @IBOutlet weak var welcome: UILabel!
    
    @IBOutlet weak var coinTwo: UIImageView!
    
    @IBOutlet weak var dollarTwo: UIImageView!
    
    @IBOutlet weak var musicLabel: UILabel!
    
    @IBOutlet weak var musicSwitch: UISwitch!
    
    @IBAction func music(_ sender: UISwitch) {
        let path = Bundle.main.path(forResource: "craves", ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
        
        if sender.isOn {
            player.play()
        }else{
            player.stop()
        }
    }
    
    @IBAction func startButton(_ sender: Any) {
        dollar.isHidden = true
        coin.isHidden = true
        welcome.isHidden = true
        dollarTwo.isHidden = false
        coinTwo.isHidden = false
        myRent.isHidden = false
        myUtilites.isHidden = false
        myCar.isHidden = false
        myInsurance.isHidden = false
        myMemberships.isHidden = false
        myFood.isHidden = false
        myEntertainment.isHidden = false
        myOther.isHidden = false
        mySavings.isHidden = false
        myCheckings.isHidden = false
        checkLabel.isHidden = false
        saveLabel.isHidden = false
        qLabel.isHidden = false
        qqlabel.isHidden = false
        rentLabel.isHidden = false
        utilitiesLabel.isHidden = false
        carLabel.isHidden = false
        insuranceLabel.isHidden = false
        membershipsLabel.isHidden = false
        foodLabel.isHidden = false
        entertainmentLabel.isHidden = false
        otherLabel.isHidden = false
        checkingsLeft.isHidden = false
        billsSpent.isHidden = false
        musicSwitch.isHidden = false
        musicLabel.isHidden = false
        
        (sender as! UIButton).isHidden = true
        
        let path = Bundle.main.path(forResource: "cash", ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
        player.play()
        
    }
    
    
    @IBAction func mySubmit(_ sender: Any) {
        let checkings = Double(myCheckings.text!)
        
        let savings = Double(mySavings.text!)
        
        let rent = Double(myRent.text!)
        
        let utilities = Double(myUtilites.text!)
        
        let car = Double(myCar.text!)
        
        let insurance = Double(myInsurance.text!)
        
        let memberships = Double(myMemberships.text!)
        
        let food = Double(myFood.text!)
        
        let entertainment = Double(myEntertainment.text!)
        
        let other = Double(myOther.text!)
        
        if checkings != nil && savings != nil && rent != nil && utilities != nil && car != nil && insurance != nil && memberships != nil && food != nil && entertainment != nil && other != nil {
            
            let total = Double(checkings! + savings!)
            
            let bills = Double(rent! + utilities! + car! + insurance! + memberships! + food! + entertainment! + other!)
            
            let left = Double(total - bills)
            
            billsSpent.text = "Spent: $\(bills)"
            
            checkingsLeft.text = "Leftover: $\(left)"
            
            error.text = " "
            
            
            if(left > 350) {
                message.text = "Keep up the good budgeting!"
                myImage.image = UIImage(named: "rich")
            }
            else if(left > 1 && left <= 350){
                message.text = "Slow down on the spending!"
                myImage.image = UIImage(named: "oh")
            }
            else if (left <= 1) {
                message.text = "Uh oh... better find a job!"
                myImage.image = UIImage(named: "diet")
            }
            
        } else {
            billsSpent.text = " "
            
            checkingsLeft.text = " "
            
            message.text = " "
            
            myImage.image = UIImage(named: "")
            
            error.text = "Please enter a numeric value or 0 for nothing."
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

