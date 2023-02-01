//
//  CoinRowView.swift
//  CryptoPrices
//
//  Created by zedsbook on 01.02.2023.
//

import SwiftUI
import Kingfisher

struct CoinRowView: View {
    
    let coin: Coin
    
    var body: some View {
        HStack {
            Text("\(coin.marketCapRank ?? 1)")
                .font(.caption)
                .foregroundColor(.gray)
            
            KFImage(URL(string: coin.image))
                .resizable()
                .scaledToFit()
                .frame(height: 32)
                .foregroundColor(.orange)
            
            
            VStack(alignment: .leading, spacing: 4) {
                Text(coin.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .padding(.leading, 6)
            }
            .padding(.leading, 2)
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                Text(coin.currentPrice.toCurrency())
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                
                Text(coin.priceChangePercentage24H.toPercent())
                    .font(.subheadline)
                    .padding(.leading, 6)
                    .foregroundColor(coin.priceChangePercentage24H > 0 ? .green : .red)
            }
        }
        
    }
}

//struct AllCoinsItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        CoinRowView()
//    }
//}
