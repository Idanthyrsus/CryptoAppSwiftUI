//
//  UIApplication+Extensions.swift
//  CryptoCurrencySwiftUI
//
//  Created by Alexander Korchak on 25.05.2023.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
