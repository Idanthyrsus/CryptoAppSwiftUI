//
//  CoinImageViewModel.swift
//  CryptoCurrencySwiftUI
//
//  Created by Alexander Korchak on 20.05.2023.
//

import Foundation
import SwiftUI
import Combine

class CoinImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = true
    private var cancellables = Set<AnyCancellable>()
    
    private let coin: Coin
    private let dataService: CoinImageService
    
    init(coin: Coin) {
        self.dataService = CoinImageService(coin: coin)
        self.coin = coin
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        dataService.$image
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: { [weak self] returnedImage in
                self?.image = returnedImage
            }
            .store(in: &cancellables)
    }
}
