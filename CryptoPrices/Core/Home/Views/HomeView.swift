//
//  HomeView.swift
//  CryptoPrices
//
//  Created by zedsbook on 01.02.2023.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                
                // Top movers view
                TopMoversView(viewModel: viewModel)
                
                // All coins view
                AllCoinsView(viewModel: viewModel)
            }
            .navigationTitle("Live Prices")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
