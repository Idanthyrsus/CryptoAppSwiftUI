//
//  String.swift
//  CryptoCurrencySwiftUI
//
//  Created by Alexander Korchak on 06.06.2023.
//

import Foundation

extension String {
    
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "",
                                         options: .regularExpression,
                                         range: nil)
    }
}
