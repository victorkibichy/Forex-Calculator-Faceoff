//
//  CurrencyListView.swift
//  Forex Calc Swift UI
//
//  Created by  Bouncy Baby on 6/7/24.
//

import Foundation
import SwiftUI

struct CurrencyListView: View {
    @State private var currencyData: CurrencyData?
    @State private var isLoading = true
    
    var body: some View {
        NavigationView {
            VStack {
                if isLoading {
                    ProgressView("Loading...")
                } else if let data = currencyData, let result = data.results.first {
                    VStack(alignment: .leading) {
                        Text(data.ticker)
                            .font(.headline)
                        Text("Close Price: \(result.close)")
                            .font(.subheadline)
                        Text("High Price: \(result.high)")
                            .font(.subheadline)
                        Text("Low Price: \(result.low)")
                            .font(.subheadline)
                        Text("Volume: \(result.volume)")
                            .font(.subheadline)
                        Text("Timestamp: \(Date(timeIntervalSince1970: Double(result.timestamp) / 1000.0))")
                            .font(.caption)
                    }
                    .padding()
                } else {
                    Text("No data available")
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
