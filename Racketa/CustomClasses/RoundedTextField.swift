//
//  CustomClasses.swift
//  Racketa
//
//  Created by Александр Оганов on 14.02.2021.
//

import UIKit

@IBDesignable

class RoundedTextField: UITextField {
    
    var padding: CGFloat = 12
    
    @IBInspectable var radius: CGFloat = 30 {
        didSet{
            layer.cornerRadius = radius
            layer.masksToBounds = true
        }
    }
    
    @IBInspectable var placeholderColor: UIColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1) {
        didSet {
            attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : placeholderColor])
        }
    }
    
    private var paddingEdge: UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: paddingEdge)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: paddingEdge)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: paddingEdge)
    }
    
}
