//
//  BusinessToBusinessView.swift
//  Forex Calc Swift UI
//
//  Created by  Bouncy Baby on 6/6/24.
//

import Foundation
import SwiftUI


    
struct BusinessToBusinessView: View {

  @State private var searchText: String = ""
  @State private var selectedStock: Stock? = nil

  let stocks: [Stock] = [ // Replace with actual data source
    Stock(symbol: "AAPL", companyName: "Apple Inc.", price: 150.23),
    Stock(symbol: "GOOG", companyName: "Alphabet Inc.", price: 2456.78),
    Stock(symbol: "TSLA", companyName: "Tesla Inc.", price: 789.42),
  ]

  var filteredStocks: [Stock] {
    if searchText.isEmpty {
      return stocks
    }
    return stocks.filter { $0.symbol.lowercased().contains(searchText.lowercased()) || $0.companyName.lowercased().contains(searchText.lowercased()) }
  }

  var body: some View {
    NavigationView {
      VStack {
        SearchBar(text: $searchText, placeholder: "Search Stocks")
        List {
          ForEach(filteredStocks) { stock in
            StockRow(stock: stock)
              .onTapGesture {
                selectedStock = stock
              }
          }
        }
        .navigationTitle("Stock Exchange")
      }
      if let selectedStock = selectedStock {
        NavigationLink {
          StockDetailView(stock: selectedStock)
        } label: {
          Text("View Details")
        }
      }
    }
  }
}

struct StockRow: View {
  let stock: Stock

  var body: some View {
    HStack {
      Text(stock.symbol)
        .font(.headline)
      Spacer()
      Text(String(format: "$%.2f", stock.price))
        .font(.body)
    }
  }
}

struct StockDetailView: View {
  let stock: Stock

  var body: some View {
    VStack {
      Text(stock.symbol)
        .font(.title)
      Text(stock.companyName)
        .font(.subheadline)
      Spacer()
      Text(String(format: "Price: $%.2f", stock.price))
        .font(.body)
    }
  }
}

struct Stock: Identifiable {
  let id = UUID() // Or any other unique identifier for your stock
  let symbol: String
  let companyName: String
  let price: Double
}

struct SearchBar: View {
  @Binding var text: String
  let placeholder: String

  var body: some View {
    HStack {
        
      TextField(placeholder, text: $text)
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
      Image(systemName: "magnifyingglass")
    }
  }
    
}
  

struct BusinessToBusinessView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessToBusinessView()
    }
}
