//
//  CodeViewController.swift
//  Racketa
//
//  Created by Александр Оганов on 14.02.2021.
//

import UIKit

class CodeViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var TitleLabel: UILabel!
    
    @IBOutlet weak var TimerLabel: UILabel!
    
    @IBOutlet weak var CodeTextField: RoundedTextField!
    
    @IBOutlet weak var CodeResetButton: UIButton!
    
    @IBOutlet weak var SendButton: CustomButton!
    
    var correctCode: String!
    
    private var code: String! {
        didSet {
            SendButton.isEnabled = code == correctCode
        }
    }
    
    var time: Int! {
        didSet {
            TimerLabel.text = "Код придет в течение " + String(format: "%d:%02d", time/60, time%60)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        time = 120
        SendButton.isEnabled = false
        createTimer()
        CodeTextField.delegate = self
    }
    
    func createTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {timer in
            self.time -= 1
            if self.time == 0 {
                timer.invalidate()
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        correctCode = textField.text
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func ResetCode(_ sender: UIButton) {
        if let VC = presentingViewController as? AuthorizationViewController {
            VC.phoneNumber = ""
            VC.PhoneTextField.text = nil
            dismiss(animated: true)
        }
    }
}
