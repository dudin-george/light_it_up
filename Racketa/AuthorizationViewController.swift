//
//  ViewController.swift
//  Racketa
//
//  Created by Александр Оганов on 14.02.2021.
//

import UIKit

class AuthorizationViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var TitleLabel: UILabel!
    
    @IBOutlet weak var AuthorizationLabel: UILabel!
    
    @IBOutlet weak var PhoneTextField: RoundedTextField!
    
    @IBOutlet weak var GetCodeButton: CustomButton!
    
    private let phoneMask = "+X (XXX) XXX-XX-XX"
    
    var phoneNumber: String! {
        didSet {
            GetCodeButton.isEnabled = phoneNumber.count == phoneMask.count
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GetCodeButton.isEnabled = false
        PhoneTextField.delegate = self
        PhoneTextField.keyboardType = .phonePad
        HideKeyBoard()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text?.count == 0 {
            textField.text = "+"
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = textField.text ?? ""
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        textField.text = phoneFormat(with: phoneMask, phone: newString)
        if textField.text == "" {
            textField.text = "+"
        }
        phoneNumber = textField.text
        return false
    }
    
    private func phoneFormat(with mask: String, phone: String) -> String {
        let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex
        
        for ch in mask where index < numbers.endIndex {
            if ch == "X" {
                result.append(numbers[index])
                index = numbers.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
        
    func HideKeyBoard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
