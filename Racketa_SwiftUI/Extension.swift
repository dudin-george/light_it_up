//
//  Extension.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 20.02.2021.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
