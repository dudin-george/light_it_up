//
//  RoundView.swift
//  Racketa
//
//  Created by Александр Оганов on 14.02.2021.
//

import UIKit

@IBDesignable

class CustomButton: UIButton {
    
    @IBInspectable var color1: UIColor! {
        didSet {
            setGradient()
        }
    }
    
    @IBInspectable var color2: UIColor! {
        didSet {
            setGradient()
        }
    }
    
    @IBInspectable var radius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = radius
            layer.masksToBounds = true
        }
    }
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
            } else {
                setTitleColor(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), for: .normal)
            }
        }
    }
    
    func setGradient() {
        guard color1 != nil && color2 != nil else {
            return
        }
        let gl = CAGradientLayer()
        gl.colors = [color1.cgColor, color2.cgColor]
        gl.startPoint = CGPoint(x: 0.0, y: 0)
        gl.endPoint = CGPoint(x: 1.0, y: 0)
        gl.frame = bounds
        gl.cornerRadius = layer.cornerRadius
        layer.insertSublayer(gl, at: 0)
    }
}
