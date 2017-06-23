//
//  ViewController.swift
//  drinkPrice
//
//  Created by Cameron Wilcox on 11/27/16.
//  Copyright © 2016 Cameron Wilcox. All rights reserved.
//

import UIKit
import SACountingLabel

class ViewController: UIViewController, UINavigationBarDelegate, UITextFieldDelegate{
    @IBOutlet var oz1: UITextField!

    @IBOutlet var abv1: UITextField!
    
    @IBOutlet var price1: UITextField!
    
    @IBOutlet var oz2: UITextField!
    
    @IBOutlet var abv2: UITextField!
    
    @IBOutlet var price2: UITextField!
    
    @IBOutlet var alcPerDollarLabel1: SACountingLabel!

    @IBOutlet var alcPerDollarLabel2: SACountingLabel!

    @IBOutlet var drink1View: UIView!
    @IBOutlet var drink2View: UIView!
    
    @IBOutlet var textFields: [UITextField]!
    
    var filledFields:Bool!
    
    @IBOutlet var calculateButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filledFields = false;
        
        calculateButton.backgroundColor = #colorLiteral(red: 1, green: 0.7607843137, blue: 0.1490196078, alpha: 1)
        calculateButton.setTitle("Next", for: .normal)
        
        
        oz1.delegate = self
        oz2.delegate = self
        abv1.delegate = self
        abv2.delegate = self
        price1.delegate = self
        price2.delegate = self
        
        oz1.addTarget(self, action: #selector(self.textFieldDidChange), for: .editingChanged)
        oz2.addTarget(self, action: #selector(self.textFieldDidChange), for: .editingChanged)
        abv1.addTarget(self, action: #selector(self.textFieldDidChange), for: .editingChanged)
        abv2.addTarget(self, action: #selector(self.textFieldDidChange), for: .editingChanged)
        price1.addTarget(self, action: #selector(self.textFieldDidChange), for: .editingChanged)
        price2.addTarget(self, action: #selector(self.textFieldDidChange), for: .editingChanged)
        
        addBottomLayerToTheView(view: oz1)
        addBottomLayerToTheView(view: oz2)
        addBottomLayerToTheView(view: price1)
        addBottomLayerToTheView(view: price2)
        addBottomLayerToTheView(view: abv1)
        addBottomLayerToTheView(view: abv2)
//
//        oz1.layer.masksToBounds = true
        
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
    
    func textFieldDidChange(textfield: UITextField) {
        if (oz1.text == "") || (abv1.text == "") || (price1.text == "") || (oz2.text == "") || (abv2.text == "") || (price2.text == ""){
            print("All Fields Must Be Filled Out")
            calculateButton.backgroundColor = #colorLiteral(red: 1, green: 0.7607843137, blue: 0.1490196078, alpha: 1)
            calculateButton.setTitle("Next", for: .normal)
        } else {
            filledFields = true;
            calculateButton.backgroundColor = #colorLiteral(red: 1, green: 0.1921568627, blue: 0, alpha: 1)
            calculateButton.setTitle("Calculate", for: .normal)
        }
    }
    
    func addBottomLayerToTheView(view: UIView){
        let border1 = CALayer()
        let width = CGFloat(1.5)
        border1.borderColor = UIColor.lightGray.cgColor
        border1.frame = CGRect(x: 0, y: oz1.frame.size.height - width, width:  oz1.frame.size.width, height: oz1.frame.size.height)
        border1.borderWidth = width;
        view.layer.addSublayer(border1)
    }
    
    func findEmptyField() -> UITextField? {
        for textField in textFields {
            if (textField.text?.isEmpty)! {
                return textField
            }
        }
        return nil
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let newString = NSString(string: textField.text!).replacingCharacters(in: range, with: string)
        
        calculateButton.backgroundColor = #colorLiteral(red: 1, green: 0.1921568627, blue: 0, alpha: 1)
        calculateButton.setTitle("Calculate", for: .normal)
        if newString.characters.count > 0 {
            calculateButton.backgroundColor = #colorLiteral(red: 1, green: 0.1921568627, blue: 0, alpha: 1)
            calculateButton.setTitle("Calculate", for: .normal)
//            for textField in textFields {
//                if (textField.text?.isEmpty)! {
//                    print("ONE OR MORE")
//                    calculateButton.backgroundColor = #colorLiteral(red: 1, green: 0.7607843137, blue: 0.1490196078, alpha: 1)
//                    calculateButton.setTitle("Next", for: .normal)
//                } else {
//                    print("None onr ON")
//                    calculateButton.backgroundColor = #colorLiteral(red: 1, green: 0.1921568627, blue: 0, alpha: 1)
//                    calculateButton.setTitle("Calculate", for: .normal)
//                }
//            }
            if (oz1.text == "") || (abv1.text == "") || (price1.text == "") || (oz2.text == "") || (abv2.text == "") || (price2.text == ""){
                calculateButton.backgroundColor = #colorLiteral(red: 1, green: 0.7607843137, blue: 0.1490196078, alpha: 1)
                calculateButton.setTitle("Next", for: .normal)
            }
        } else {
            calculateButton.backgroundColor = #colorLiteral(red: 1, green: 0.7607843137, blue: 0.1490196078, alpha: 1)
            calculateButton.setTitle("Next", for: .normal)
        }
        return true
    }
    
    @IBAction func getVal () {

        if let emptyField = findEmptyField() {
            // focus emptyField or give a message
            print(textFields.index(of: emptyField)!)
            emptyField.becomeFirstResponder()
        }
        
//        print(textFields)
        
        if (oz1.text == "") || (abv1.text == "") || (price1.text == "") || (oz2.text == "") || (abv2.text == "") || (price2.text == ""){
            print("All Fields Must Be Filled Out")
        }else {
        
        let abvPercent1 = Double(abv1.text!)! / 100
        
        
        let totalAlcohol1 = (Double(oz1.text!)! * abvPercent1)
        
        
        let total1 = (totalAlcohol1 / Double(price1.text!)!) * 100
    
        let abvPercent2 = Double(abv2.text!)! / 100
        
        
        let totalAlcohol2 = (Double(oz2.text!)! * abvPercent2)
        
        
        let total2 = (totalAlcohol2 / Double(price2.text!)!) * 100
    
            print(totalAlcohol1)
            print(total1)
            
            alcPerDollarLabel1.format = "%.1f%% Alcohol/$"
            alcPerDollarLabel1.countFrom(fromValue: 0, to: Float(total1), withDuration: 0.6, andAnimationType: .EaseOut, andCountingType: .Custom)
            
            alcPerDollarLabel2.format = "%.1f%% Alcohol/$"
            alcPerDollarLabel2.countFrom(fromValue: 0, to: Float(total2), withDuration: 0.6, andAnimationType: .EaseOut, andCountingType: .Custom)
            
            if total1 > total2 {
                alcPerDollarLabel1.font = alcPerDollarLabel1.font.withSize(30)
                alcPerDollarLabel1.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                alcPerDollarLabel2.font = alcPerDollarLabel2.font.withSize(20)
            } else {
                alcPerDollarLabel2.font = alcPerDollarLabel2.font.withSize(30)
                alcPerDollarLabel2.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                alcPerDollarLabel1.font = alcPerDollarLabel1.font.withSize(20)
            }
//        alcPerDollarLabel1.text = String(format: "%.1f%% ALC/$")
//        alcPerDollarLabel2.text = String(format: "%.1f%% ALC/$", total2)
            
        }
    }
    
    @IBAction func reset () {
        
        calculateButton.backgroundColor = #colorLiteral(red: 1, green: 0.7607843137, blue: 0.1490196078, alpha: 1)
        calculateButton.setTitle("Next", for: .normal)

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

