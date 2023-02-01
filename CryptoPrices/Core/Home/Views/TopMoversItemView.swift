//
//  TopMoversItemView.swift
//  CryptoPrices
//
//  Created by zedsbook on 01.02.2023.
//

import SwiftUI
import Kingfisher

struct TopMoversItemView: View {
    
    let coin: Coin
    
    var body: some View {
        VStack(alignment: .leading) {
            // Image
            KFImage(URL(string: coin.image))
                .resizable()
                .scaledToFit()
                .frame(height: 32)
                .foregroundColor(.orange)
                .padding(.bottom, 2)
            
            // Coin info
            HStack(spacing: 2) {
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .fontWeight(.bold)
                
                Text(coin.currentPrice.toCurrency())
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            // Coin percent change
            Text(coin.priceChangePercentage24H.toPercent())
                .font(.title2)
                .foregroundColor(coin.priceChangePercentage24H > 0 ? .green : .red)
        }
        .frame(width: 140, height: 140)
        .background(Color("ItemBackgroundColor"))
        .cornerRadius(10)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.systemGray4), lineWidth: 2)
        }
        .padding(.all, 1)
    }
}

//struct TopMoversItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        TopMoversItemView()
//    }
//}
