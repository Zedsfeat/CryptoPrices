//
//  HomeViewModel.swift
//  CryptoPrices
//
//  Created by zedsbook on 01.02.2023.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var coins = [Coin]()
    @Published var topMovingCoins = [Coin]()
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=1h"
         
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error {
                print("DEBUG: Error \(error.localizedDescription)")
                return
            }
            
            guard let data else { return }
            do {
                let coins = try JSONDecoder().decode([Coin].self, from: data)
                DispatchQueue.main.async {
                    self.coins = coins
                    self.configureTopMovingCoins()
                }
            } catch let error {
                print("DEBUG: Failed to decode with error \(error.localizedDescription)")
            }
        }.resume()
    }
    
    func configureTopMovingCoins() {
        let topMovers = coins.sorted(by: { $0.priceChangePercentage24H > $1.priceChangePercentage24H })
        self.topMovingCoins = Array(topMovers.prefix(5))
    }
    
    
}
