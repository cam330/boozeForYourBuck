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

    @IBOutlet var drink1View: UIView!
    @IBOutlet var drink2View: UIView!
    
    @IBOutlet var drink1ProgressView: UIProgressView!
    @IBOutlet var drink2ProgressView: UIProgressView!
    
    
    @IBOutlet var calculateButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.drink1ProgressView.isHidden = true
        self.drink2ProgressView.isHidden = true
        
        oz1.becomeFirstResponder();
        
        resetButton.isHidden = true
        
        if(oz1.text != ""){
            calculateButton.isHidden = true
        }
        
        self.drink1View.layer.shadowColor = UIColor.black.cgColor
        self.drink1View.layer.shadowOpacity = 0.2
        self.drink1View.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.drink1View.layer.shadowRadius = 1
        
        self.drink2View.layer.shadowColor = UIColor.black.cgColor
        self.drink2View.layer.shadowOpacity = 0.2
        self.drink2View.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.drink2View.layer.shadowRadius = 1
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
        
        alcPerDollarLabel1.text = String(format: "1: %.3foz. ALC Per Dollar", total1)
        alcPerDollarLabel2.text = String(format: "2: %.3foz. ALC Per Dollar", total2)
            
         self.drink1ProgressView.isHidden = false
         self.drink2ProgressView.isHidden = false
            
            print(total1)
            print(total2)
            
            if total2 < 0.1 && total1 < 0.1 {
                self.drink1ProgressView.setProgress(Float(total1 * 10), animated: true)
                self.drink2ProgressView.setProgress(Float(total2 * 10), animated: true)
                print("TOP")
            } else if total2 < 0.5 && total1 < 0.5 {
                self.drink1ProgressView.setProgress(Float(total1 * 5), animated: true)
                self.drink2ProgressView.setProgress(Float(total2 * 5), animated: true)
                print("BOTTOM")
            } else {
                self.drink1ProgressView.setProgress(Float(total1), animated: true)
                self.drink2ProgressView.setProgress(Float(total2), animated: true)
                print("LAST")
            }
            
         
        
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
        
        self.drink1ProgressView.isHidden = true
        self.drink2ProgressView.isHidden = true
        
        oz1.becomeFirstResponder()
        
    }

}

