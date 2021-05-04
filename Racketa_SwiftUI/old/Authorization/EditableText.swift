//
//  PhoneEditableText.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 18.02.2021.
//

import SwiftUI


struct PhoneEditableText: View {
    
    var placeHolder: String
    var onChanged: (String) -> Void
    
    init(placeHolder: String, text: String, onChanged: @escaping (String) -> Void) {
        self.placeHolder = placeHolder
        self.onChanged = onChanged
        textBindingManager.text = text
    }
    
    @ObservedObject var textBindingManager = TextBindingManager(limit: 18)
    
    var body: some View {
        ZStack(alignment: .leading) {
            let biding = Binding<String>(get: {
                return textBindingManager.text
            }, set: {
                var str = $0.count == 1 ? "7" : ""
                str += $0
                textBindingManager.text = phoneFormat(with: phoneMask, for: str)
                onChanged(textBindingManager.text)
            })
            TextField(placeHolder, text: biding)
                .padding(10)
                .foregroundColor(.white)
                .keyboardType(.numberPad)
        }
    }
    
    private let phoneMask = "+X (XXX) XXX-XX-XX"
    
    private func phoneFormat(with mask: String, for phone: String) -> String{
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
    
}
