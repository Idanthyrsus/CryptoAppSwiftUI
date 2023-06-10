//
//  MarketDataService.swift
//  CryptoCurrencySwiftUI
//
//  Created by Alexander Korchak on 01.06.2023.
//

import Foundation
import Combine

protocol MarketDataServiceProtocol {
   func getData()
}

final class MarketDataService {
    @Published var marketData: MarketData? = nil
    var marketDataSubscription: AnyCancellable?
    
    init() {
        getData()
    }
    
    func getData() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else {
            return
        }
        
        marketDataSubscription = NetworkingManager.download(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion,
                  receiveValue: {  [weak self]  returnedData in
                guard let self = self else {
                    return
                }
                self.marketData = returnedData.data
                self.marketDataSubscription?.cancel()
            })
    }
}
