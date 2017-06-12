//
//  Count.swift
//  Budget Booze
//
//  Created by Cameron Wilcox on 4/6/17.
//  Copyright © 2017 Cameron Wilcox. All rights reserved.
//

import UIKit
import SACountingLabel

class Count: UIViewController {

    @IBOutlet var countLbl: SACountingLabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        countLbl.countFrom(fromValue: 0, to: 100, withDuration: 1.0, andAnimationType: .EaseOut, andCountingType: .Float)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
