//
//  ViewController.swift
//  drinkPrice
//
//  Created by Cameron Wilcox on 11/27/16.
//  Copyright © 2016 Cameron Wilcox. All rights reserved.
//

import UIKit
import SACountingLabel
import FontAwesome_swift

class ViewController: UIViewController, UITextFieldDelegate{
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
    @IBOutlet var resetButton: UIButton!
    @IBOutlet var dollarLabel: UILabel!
    @IBOutlet var calculateButton: UIButton!
    var fieldsArray = [Any]()
    var filledFields:Bool!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dollarLabel.isHidden = true
        
        fieldsArray = [oz1, oz2, abv1, abv2, price1, price2]

        resetButton.layer.cornerRadius = 25;
        resetButton.backgroundColor = UIColor.white
        resetButton.setTitleColor(UIColor(red: 255/255, green: 117/255, blue: 141/255, alpha: 1.0), for: UIControlState.normal)
        resetButton.setTitleColor(UIColor(red: 255/255, green: 117/255, blue: 141/255, alpha: 1.0), for: UIControlState.selected)
        resetButton.titleLabel?.font = UIFont.fontAwesome(ofSize: 34)
        resetButton.setTitle(String.fontAwesomeIcon(name: .refresh), for: .normal)
        
        
        filledFields = false;
        
        calculateButton.backgroundColor = UIColor.white
        calculateButton.setTitleColor(UIColor(red: 255/255, green: 74/255, blue: 106/255, alpha: 1.0), for: UIControlState.normal);
        calculateButton.layer.borderWidth = 1;
        calculateButton.layer.borderColor = UIColor(red: 255/255, green: 74/255, blue: 106/255, alpha: 1.0).cgColor
    
        calculateButton.setTitle("Next", for: .normal)
        
        for field in fieldsArray {
            (field as! UITextField).delegate = self
            (field as! UITextField).addTarget(self, action: #selector(self.textFieldDidChange), for: .editingChanged)
        }
        
        addBottomLayerToTheView(view: oz1)
        addBottomLayerToTheView(view: oz2)
        addBottomLayerToTheView(view: price1)
        addBottomLayerToTheView(view: price2)
        addBottomLayerToTheView(view: abv1)
        addBottomLayerToTheView(view: abv2)
        
        oz1.becomeFirstResponder();
        
        if(oz1.text != ""){
            calculateButton.isHidden = true
        }
        
        self.drink1View.layer.shadowColor = UIColor.black.cgColor
        self.drink1View.layer.shadowOpacity = 0.4
        self.drink1View.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        self.drink1View.layer.shadowRadius = 3
        self.drink1View.layer.cornerRadius = 5
        
        self.drink2View.layer.shadowColor = UIColor.black.cgColor
        self.drink2View.layer.shadowOpacity = 0.4
        self.drink2View.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        self.drink2View.layer.shadowRadius = 3
        self.drink2View.layer.cornerRadius = 5
        
        if  UIScreen.main.bounds.height < 568.0{
            self.oz1.resignFirstResponder()
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
    }
    
    func textFieldDidChange(textfield: UITextField) {
        if (oz1.text == "") || (abv1.text == "") || (price1.text == "") || (oz2.text == "") || (abv2.text == "") || (price2.text == ""){
            calculateButton.backgroundColor = UIColor.white
            calculateButton.setTitleColor(UIColor(red: 255/255, green: 74/255, blue: 106/255, alpha: 1.0), for: UIControlState.normal);
            calculateButton.layer.borderWidth = 1;
            calculateButton.layer.borderColor = UIColor(red: 255/255, green: 74/255, blue: 106/255, alpha: 1.0).cgColor
            calculateButton.setTitle("Next", for: .normal)
        } else {
            filledFields = true;
            calculateButton.backgroundColor = UIColor(red: 255/255, green: 74/255, blue: 106/255, alpha: 1.0)
            calculateButton.setTitleColor(UIColor.white, for: UIControlState.normal);
            calculateButton.layer.borderWidth = 1;
            calculateButton.layer.borderColor = UIColor.white.cgColor
            calculateButton.setTitle("Calculate", for: .normal)
        }
    }
    
    func addBottomLayerToTheView(view: UIView){
        let border1 = CALayer()
        let width = CGFloat(1.5)
        border1.borderColor = UIColor.white.cgColor
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
        
        let countDots = (textField.text?.components(separatedBy: ".").count)! - 1
        
        if countDots > 0 && string == "." {
            return false
        }
        
        let newString = NSString(string: textField.text!).replacingCharacters(in: range, with: string)
        calculateButton.backgroundColor = UIColor(red: 255/255, green: 74/255, blue: 106/255, alpha: 1.0)
        calculateButton.setTitleColor(UIColor.white, for: UIControlState.normal);
        calculateButton.layer.borderWidth = 1;
        calculateButton.layer.borderColor = UIColor.white.cgColor
        calculateButton.setTitle("Calculate", for: .normal)
        if newString.characters.count > 0 {
            calculateButton.backgroundColor = UIColor(red: 255/255, green: 74/255, blue: 106/255, alpha: 1.0)
            calculateButton.setTitleColor(UIColor.white, for: UIControlState.normal);
            calculateButton.layer.borderWidth = 1;
            calculateButton.layer.borderColor = UIColor.white.cgColor
            calculateButton.setTitle("Calculate", for: .normal)
            if (oz1.text == "") || (abv1.text == "") || (price1.text == "") || (oz2.text == "") || (abv2.text == "") || (price2.text == ""){
                calculateButton.backgroundColor = UIColor.white
                calculateButton.setTitleColor(UIColor(red: 255/255, green: 74/255, blue: 106/255, alpha: 1.0), for: UIControlState.normal);
                calculateButton.layer.borderWidth = 1;
                calculateButton.layer.borderColor = UIColor(red: 255/255, green: 74/255, blue: 106/255, alpha: 1.0).cgColor
                calculateButton.setTitle("Next", for: .normal)
            }
        } else {
            calculateButton.backgroundColor = UIColor.white
            calculateButton.setTitleColor(UIColor(red: 255/255, green: 74/255, blue: 106/255, alpha: 1.0), for: UIControlState.normal);
            calculateButton.layer.borderWidth = 1;
            calculateButton.layer.borderColor = UIColor(red: 255/255, green: 74/255, blue: 106/255, alpha: 1.0).cgColor
            calculateButton.setTitle("Next", for: .normal)
        }
        return true
    }
    
    @IBAction func getVal () {

        if let emptyField = findEmptyField() {
            emptyField.becomeFirstResponder()
        }else {
            for field in fieldsArray {
                if (field as! UITextField).text == "." {
                    (field as! UITextField).text = "0"
                }
            }
        let abvPercent1 = Double(abv1.text!)! / 100
        let totalAlcohol1 = (Double(oz1.text!)! * abvPercent1)
        var total1 = (totalAlcohol1 / Double(price1.text!)!) * 100
            if total1.isNaN || total1.isInfinite {
                total1 = 0
            }
        let abvPercent2 = Double(abv2.text!)! / 100
        let totalAlcohol2 = (Double(oz2.text!)! * abvPercent2)
        var total2 = (totalAlcohol2 / Double(price2.text!)!) * 100
            if total2.isNaN || total2.isInfinite{
                total2 = 0
            }
            alcPerDollarLabel1.format = "%.1f%%"
            alcPerDollarLabel1.countFrom(fromValue: 0, to: Float(total1), withDuration: 0.6, andAnimationType: .EaseOut, andCountingType: .Custom)
            alcPerDollarLabel2.format = "%.1f%%"
            alcPerDollarLabel2.countFrom(fromValue: 0, to: Float(total2), withDuration: 0.6, andAnimationType: .EaseOut, andCountingType: .Custom)
            if total1 > total2 {
                UIView.animate(withDuration: 0.4,animations: {
                    self.alcPerDollarLabel1.transform = CGAffineTransform(scaleX: 1.7, y: 1.7)
                    self.alcPerDollarLabel1.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                })
                self.alcPerDollarLabel1.font = self.alcPerDollarLabel1.font.withSize(30)
                alcPerDollarLabel1.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                alcPerDollarLabel2.font = alcPerDollarLabel2.font.withSize(20)
            } else {
                UIView.animate(withDuration: 0.4,animations: {
                    self.alcPerDollarLabel2.transform = CGAffineTransform(scaleX: 1.7, y: 1.7)
                    self.alcPerDollarLabel2.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                })
                self.alcPerDollarLabel2.font = self.alcPerDollarLabel2.font.withSize(30)
                alcPerDollarLabel2.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                alcPerDollarLabel1.font = alcPerDollarLabel1.font.withSize(20)
            }
            dollarLabel.isHidden = false
        }
    }
    
    @IBAction func windup(){
        resetButton.windupRotation()
        resetButton.transform = CGAffineTransform(rotationAngle: -CGFloat(Double.pi / 4))
    }
    
    @IBAction func canceledReset(){
        resetButton.transform = CGAffineTransform(rotationAngle: -CGFloat(Double.pi * 4))
    }
    
    @IBAction func reset () {
        dollarLabel.isHidden = true
        resetButton.rotate360Degrees()
        calculateButton.backgroundColor = UIColor.white
        calculateButton.setTitleColor(UIColor(red: 255/255, green: 74/255, blue: 106/255, alpha: 1.0), for: UIControlState.normal);
        calculateButton.layer.borderWidth = 1;
        calculateButton.layer.borderColor = UIColor(red: 255/255, green: 74/255, blue: 106/255, alpha: 1.0).cgColor
        calculateButton.setTitle("Next", for: .normal)
        for field in fieldsArray {
            (field as! UITextField).text = ""
        }
        alcPerDollarLabel1.text = "Drink 1"
        alcPerDollarLabel1.font = alcPerDollarLabel1.font.withSize(25)
        alcPerDollarLabel1.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        alcPerDollarLabel2.text = "Drink 2"
        alcPerDollarLabel2.font = alcPerDollarLabel2.font.withSize(25)
        alcPerDollarLabel2.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        oz1.becomeFirstResponder()
        resetButton.transform = CGAffineTransform(rotationAngle: -CGFloat(Double.pi * 4))
    }
}

