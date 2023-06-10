//
//  CoinDetailDataService.swift
//  CryptoCurrencySwiftUI
//
//  Created by Alexander Korchak on 04.06.2023.
//

import Foundation
import Combine

final class CoinDetailDataService {
    
    @Published var coinDetails: CoinDetail? = nil
    var coinDetailSubscription: AnyCancellable?
    var coin: Coin
    
    init(coin: Coin) {
        self.coin = coin
        getCoinDetails()
    }
    
    func getCoinDetails() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/\(coin.id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false") else {
            return
        }
        
        coinDetailSubscription = NetworkingManager.download(url: url)
            .decode(type: CoinDetail.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion,
                  receiveValue: {  [weak self]  returnedCoinDetails in
                guard let self = self else {
                    return
                }
                self.coinDetails = returnedCoinDetails
                self.coinDetailSubscription?.cancel()
            })
    }
}
