//
//  UIViewExtentions.swift
//  Pods
//
//  Created by Cameron Wilcox on 6/29/17.
//
//

import Foundation

import UIKit

extension UIView {
    func rotate360Degrees(duration: CFTimeInterval = 0.3, completionDelegate: AnyObject? = nil) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(Double.pi * 2)
        rotateAnimation.duration = duration
        
        if let delegate: AnyObject = completionDelegate {
            rotateAnimation.delegate = delegate as? CAAnimationDelegate
        }
        self.layer.add(rotateAnimation, forKey: nil)
    }
    func windupRotation(duration: CFTimeInterval = 0.1, completionDelegate: AnyObject? = nil) {
        let windupAnimation = CABasicAnimation(keyPath: "transform.rotation")
        windupAnimation.fromValue = 0.0
        windupAnimation.toValue = -CGFloat(Double.pi / 4)
//        windupAnimation.duration = duration
        
        if let delegate: AnyObject = completionDelegate {
            windupAnimation.delegate = delegate as? CAAnimationDelegate
        }
        self.layer.add(windupAnimation, forKey: nil)
    }
}
