//
//  ViewController.swift
//  drinkPrice
//
//  Created by Cameron Wilcox on 11/27/16.
//  Copyright © 2016 Cameron Wilcox. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var oz1: UITextField!

    @IBOutlet var abv1: UITextField!
    
    @IBOutlet var price1: UITextField!
    
    @IBOutlet var oz2: UITextField!
    
    @IBOutlet var abv2: UITextField!
    
    @IBOutlet var price2: UITextField!
    
    @IBOutlet var finalLabel1: UILabel!
    
    @IBOutlet var finalLabel2: UILabel!
    
    @IBOutlet var alcPerDollarLabel1: UILabel!
    
    @IBOutlet var resetButton: UIButton!
    @IBOutlet var alcPerDollarLabel2: UILabel!

    
    @IBOutlet var calculateButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        oz1.becomeFirstResponder();
        
        resetButton.isHidden = true
        
        if(oz1.text != ""){
            calculateButton.isHidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getVal () {

        
        if (oz1.text == "") || (abv1.text == "") || (price1.text == "") || (oz2.text == "") || (abv2.text == "") || (price2.text == ""){
            print("Enter stuff")
        }else {
        
        let abvPercent1 = Double(abv1.text!)! / 100
        print(abvPercent1)
        
        let totalAlcohol1 = (Double(oz1.text!)! * abvPercent1)
        print(totalAlcohol1)
        
        let total1 = (totalAlcohol1 / Double(price1.text!)!)
        
        let abvPercent2 = Double(abv2.text!)! / 100
        print(abvPercent2)
        
        let totalAlcohol2 = (Double(oz2.text!)! * abvPercent2)
        print(totalAlcohol2)
        
        let total2 = (totalAlcohol2 / Double(price2.text!)!)
            
            
        //NEED TO DO! change it from displaying color to making size bigger
        if total1 > total2 {
            alcPerDollarLabel1.font = alcPerDollarLabel1.font.withSize(26)
            alcPerDollarLabel2.font = alcPerDollarLabel1.font.withSize(20)
        } else {
            alcPerDollarLabel2.font = alcPerDollarLabel1.font.withSize(26)
            alcPerDollarLabel1.font = alcPerDollarLabel1.font.withSize(20)
        }
        
        alcPerDollarLabel1.text = String(format: "1: %.3foz. ALC Per Dollar", total1)
        alcPerDollarLabel2.text = String(format: "2: %.3foz. ALC Per Dollar", total2)
        
//        alcPerDollarLabel2.textColor = UIColor.red
        
        resetButton.isHidden = false;
        }
    }
    
    @IBAction func reset () {
        resetButton.isHidden = true;
        
        oz1.text = ""
        oz2.text = ""
        
        abv1.text = ""
        abv2.text = ""
        
        price1.text = ""
        price2.text = ""
        
        alcPerDollarLabel1.text = ""
        alcPerDollarLabel2.text = ""
        
        oz1.becomeFirstResponder()
        
    }

}

