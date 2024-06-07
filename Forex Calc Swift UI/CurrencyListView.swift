//
//  CurrencyListView.swift
//  Forex Calc Swift UI
//
//  Created by  Bouncy Baby on 6/7/24.
//

import Foundation
import SwiftUI

struct CurrencyListView: View {
    @State private var currencyData: [CurrencyData] = []
    @State private var isLoading = true
    
    var body: some View {
        NavigationView {
            List(currencyData, id: \.ticker) { data in
                VStack(alignment: .leading) {
                    Text(data.ticker)
                        .font(.headline)
                    Text("Price: \(data.lastTradePrice)")
                        .font(.subheadline)
                    Text("Timestamp: \(Date(timeIntervalSince1970: Double(data.lastTradeTimestamp) / 1000.0))")
                        .font(.caption)
                }
            }
            .navigationTitle("Currency Data")
            .onAppear(perform: loadData)
        }
    }
    
    func loadData() {
        isLoading = true
        CurrencyDataService().fetchCurrencyData { result in
            DispatchQueue.main.async {
                isLoading = false
                switch result {
                case .success(let data):
                    self.currencyData = data
                case .failure(let error):
                    print("Error fetching data: \(error)")
                }
            }
        }
    }
}

struct CurrencyListView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyListView()
    }
}
