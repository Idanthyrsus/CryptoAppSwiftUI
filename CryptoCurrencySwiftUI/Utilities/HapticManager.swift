//
//  HapticManager.swift
//  CryptoCurrencySwiftUI
//
//  Created by Alexander Korchak on 04.06.2023.
//

import Foundation
import SwiftUI

class HapticManager {
    static let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
