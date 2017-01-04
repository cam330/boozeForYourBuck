//
//  ViewController.swift
//  drinkPrice
//
//  Created by Cameron Wilcox on 11/27/16.
//  Copyright © 2016 Cameron Wilcox. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationBarDelegate{
    @IBOutlet var oz1: UITextField!

    @IBOutlet var abv1: UITextField!
    
    @IBOutlet var price1: UITextField!
    
    @IBOutlet var oz2: UITextField!
    
    @IBOutlet var abv2: UITextField!
    
    @IBOutlet var price2: UITextField!
    
    @IBOutlet var alcPerDollarLabel1: UILabel!

    @IBOutlet var alcPerDollarLabel2: UILabel!

    @IBOutlet var drink1View: UIView!
    @IBOutlet var drink2View: UIView!

    
    
    @IBOutlet var calculateButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController!.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "PingFang HK", size: 20.0)!]
        
        oz1.becomeFirstResponder();
        
        if(oz1.text != ""){
            calculateButton.isHidden = true
        }
        
        self.drink1View.layer.shadowColor = UIColor.black.cgColor
        self.drink1View.layer.shadowOpacity = 0.2
        self.drink1View.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.drink1View.layer.shadowRadius = 2
        self.drink1View.layer.cornerRadius = 5
        
        self.drink2View.layer.shadowColor = UIColor.black.cgColor
        self.drink2View.layer.shadowOpacity = 0.2
        self.drink2View.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.drink2View.layer.shadowRadius = 2
        self.drink2View.layer.cornerRadius = 5
        
        if  UIScreen.main.bounds.height < 568.0{
            print("DOESN")
            self.oz1.resignFirstResponder()
//            let iPhone4View = UIView(frame: CGRect(x: 0, y:0, width: self.view.frame.size.width, height: self.view.frame.size.height))
//            iPhone4View.backgroundColor = UIColor.white
            let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.extraLight)
            let iPhone4View = UIVisualEffectView(effect: blurEffect)
            iPhone4View.frame = CGRect(x: 0, y:0, width: self.view.frame.size.width, height: self.view.frame.size.height)
            let sorryText1 = UILabel(frame: CGRect(x: iPhone4View.center.x-125, y:iPhone4View.center.y-50, width:250, height: 100))
            let sorryText2 = UILabel(frame: CGRect(x: iPhone4View.center.x-125, y:iPhone4View.center.y-25, width:250, height: 100))
            sorryText1.text = "Sorry, but this app requires"
            sorryText2.text = "iPhone 5 or higher :("
            sorryText2.textAlignment = NSTextAlignment.center
            sorryText1.textAlignment = NSTextAlignment.center
            iPhone4View.addSubview(sorryText1)
            iPhone4View.addSubview(sorryText2)
            UIApplication.shared.keyWindow?.addSubview(iPhone4View)
        }
        
        print(UIScreen.main.bounds.height)
    }
    
    @IBAction func getVal () {

        if (oz1.text == "") || (abv1.text == "") || (price1.text == "") || (oz2.text == "") || (abv2.text == "") || (price2.text == ""){
            print("All Fields Must Be Filled Out")
        }else {
        
        let abvPercent1 = Double(abv1.text!)! / 100
        
        
        let totalAlcohol1 = (Double(oz1.text!)! * abvPercent1)
        
        
        let total1 = (totalAlcohol1 / Double(price1.text!)!) * 100
        
        let abvPercent2 = Double(abv2.text!)! / 100
        
        
        let totalAlcohol2 = (Double(oz2.text!)! * abvPercent2)
        
        
        let total2 = (totalAlcohol2 / Double(price2.text!)!) * 100
            
            
        if total1 > total2 {
            alcPerDollarLabel1.font = alcPerDollarLabel1.font.withSize(30)
            alcPerDollarLabel1.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            alcPerDollarLabel2.font = alcPerDollarLabel2.font.withSize(20)
        } else {
            alcPerDollarLabel2.font = alcPerDollarLabel2.font.withSize(30)
            alcPerDollarLabel2.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            alcPerDollarLabel1.font = alcPerDollarLabel1.font.withSize(20)
        }
        
        alcPerDollarLabel1.text = String(format: "%.1f%% ALC/$", total1)
        alcPerDollarLabel2.text = String(format: "%.1f%% ALC/$", total2)
            
        }
    }
    
    @IBAction func reset () {

        oz1.text = ""
        oz2.text = ""
        
        abv1.text = ""
        abv2.text = ""
        
        price1.text = ""
        price2.text = ""
        
        alcPerDollarLabel1.text = "Drink 1"
        alcPerDollarLabel1.font = alcPerDollarLabel1.font.withSize(25)
        alcPerDollarLabel1.textColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
        alcPerDollarLabel2.text = "Drink 2"
        alcPerDollarLabel2.font = alcPerDollarLabel2.font.withSize(25)
        alcPerDollarLabel2.textColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)

        oz1.becomeFirstResponder()
        
    }

}

