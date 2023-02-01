//
//  AllCoinsView.swift
//  CryptoPrices
//
//  Created by zedsbook on 01.02.2023.
//

import SwiftUI

struct AllCoinsView: View {
    
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("All Coins")
                .font(.headline)
                .padding(.horizontal)
                .padding(.top, 10)
                
            
            HStack {
                Text("Coin")
                Spacer()
                Text("Price")
            }
            .font(.caption)
            .foregroundColor(.gray)
            .padding(.horizontal)
            
            ScrollView(.vertical) {
                ForEach(viewModel.coins) { coin in
                    CoinRowView(coin: coin)
                }
            }
            .padding(.leading, 7)
            .padding(.trailing)
        }
    }
}


//struct AllCoinsView_Previews: PreviewProvider {
//    static var previews: some View {
//        AllCoinsView()
//    }
//}
