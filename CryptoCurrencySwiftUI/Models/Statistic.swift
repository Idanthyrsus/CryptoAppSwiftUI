//
//  StatisticModel.swift
//  CryptoCurrencySwiftUI
//
//  Created by Alexander Korchak on 26.05.2023.
//

import Foundation

struct Statistic: Identifiable {
    var id = UUID().uuidString
    let title: String
    let value: String
    let percentageChange: Double?
    
    init(title: String, value: String, percentageChange: Double? = nil) {
        self.title = title
        self.value = value
        self.percentageChange = percentageChange
    }
}
