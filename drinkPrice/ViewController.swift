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
    
//    @IBOutlet var resetButton: UIButton!
    @IBOutlet var alcPerDollarLabel2: UILabel!

    @IBOutlet var drink1View: UIView!
    @IBOutlet var drink2View: UIView!

    
    
    @IBOutlet var calculateButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
        oz1.becomeFirstResponder();
        
//        resetButton.isHidden = true
        
        if(oz1.text != ""){
            calculateButton.isHidden = true
        }
        
        self.drink1View.layer.shadowColor = UIColor.black.cgColor
        self.drink1View.layer.shadowOpacity = 0.2
        self.drink1View.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.drink1View.layer.shadowRadius = 1
        self.drink1View.layer.cornerRadius = 4
        
        self.drink2View.layer.shadowColor = UIColor.black.cgColor
        self.drink2View.layer.shadowOpacity = 0.2
        self.drink2View.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.drink2View.layer.shadowRadius = 1
        self.drink2View.layer.cornerRadius = 4
        
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
        
        
        let totalAlcohol1 = (Double(oz1.text!)! * abvPercent1)
        
        
        let total1 = (totalAlcohol1 / Double(price1.text!)!)
        
        let abvPercent2 = Double(abv2.text!)! / 100
        
        
        let totalAlcohol2 = (Double(oz2.text!)! * abvPercent2)
        
        
        let total2 = (totalAlcohol2 / Double(price2.text!)!)
            
            
        //NEED TO DO! change it from displaying color to making size bigger
        if total1 > total2 {
            alcPerDollarLabel1.font = alcPerDollarLabel1.font.withSize(26)
            alcPerDollarLabel2.font = alcPerDollarLabel1.font.withSize(20)
        } else {
            alcPerDollarLabel2.font = alcPerDollarLabel1.font.withSize(26)
            alcPerDollarLabel1.font = alcPerDollarLabel1.font.withSize(20)
        }
        
        alcPerDollarLabel1.text = String(format: "%.3foz. ALC / $", total1)
        alcPerDollarLabel2.text = String(format: "%.3foz. ALC/$", total2)
            
            print(total1)
            print(total2)
            
         
        
//        alcPerDollarLabel2.textColor = UIColor.red
        
//        resetButton.isHidden = false;
        }
    }
    
    @IBAction func reset () {
//        resetButton.isHidden = true;
        
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

