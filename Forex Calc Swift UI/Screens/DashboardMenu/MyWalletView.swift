//
//  Forex_Calc_Swift_UIApp.swift
//  Forex Calc Swift UI
//
//  Created by  Bouncy Baby on 5/16/24.
//
import SwiftUI

struct MyWalletView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    // Welcome and Transactions Section
                    VStack(alignment: .leading) {
                        Text("Hello, Kibichy")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.top)
                        
                        Text("Welcome back to FX Faceoff")
                            .font(.subheadline)
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                        
                        HStack {
                            TransactionCardView(transactionName: "Kate Konza", transactionType: "Wallet Top-Up")
                            Spacer()
                            BalanceCardView(balance: "Ksh.21,000.00")
                        }
                        .padding(.top)
                    }
                    .padding(.horizontal)
                    
                    // Stock Trends Section
                    VStack(alignment: .leading) {
                        Text("Stock Trends")
                            .font(.headline)
                            .padding(.vertical)
                        
                        ForEach(stockTrends) { trend in
                            StockTrendView(stockTrend: trend)
                        }
                    }
                    .padding(.horizontal)
                    
                    // Top Movers Section
                    VStack(alignment: .leading) {
                        Text("Top Movers")
                            .font(.headline)
                            .padding(.vertical)
                        
                        ForEach(topMovers) { mover in
                            TopMoverView(topMover: mover)
                        }
                    }
                    .padding(.horizontal)
                    
                }
            }
            .background(Color.teal)
            .navigationBarHidden(true)
        }
    }
}

// Dummy Data and Models
struct StockTrend: Identifiable {
    var id = UUID()
    var name: String
    var value: String
    var change: String
}

struct TopMover: Identifiable {
    var id = UUID()
    var name: String
    var change: String
}

let stockTrends = [
    StockTrend(name: "Dangote", value: "Ksh.15,000", change: "+2,543.00"),
    StockTrend(name: "Shell", value: "Ksh.30,000", change: "-1,543.00"),
    StockTrend(name: "Facebook", value: "Ksh.20,000", change: "+3,543.00"),
    StockTrend(name: "Apple", value: "Ksh.29,000", change: "-3,543.00")
]

let topMovers = [
    TopMover(name: "AMZN", change: "+5.34%"),
    TopMover(name: "Netflix", change: "-3.21%"),
    TopMover(name: "Tesla", change: "+7.14%")
]

// Subviews
struct TransactionCardView: View {
    var transactionName: String
    var transactionType: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(transactionName)
                .font(.headline)
                .padding(.bottom, 2)
            Text(transactionType)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 5)
    }
}

struct BalanceCardView: View {
    var balance: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Available Balance")
                .font(.subheadline)
                .foregroundColor(.gray)
            Text(balance)
                .font(.headline)
                .padding(.bottom, 2)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 5)
    }
}

struct StockTrendView: View {
    var stockTrend: StockTrend
    
    var body: some View {
        HStack {
            Text(stockTrend.name)
                .font(.subheadline)
                .padding(.leading)
            Spacer()
            Text(stockTrend.value)
                .font(.subheadline)
            Text(stockTrend.change)
                .font(.subheadline)
                .foregroundColor(stockTrend.change.contains("+") ? .green : .red)
                .padding(.trailing)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 5)
        .padding(.vertical, 2)
    }
}

struct TopMoverView: View {
    var topMover: TopMover
    
    var body: some View {
        HStack {
            Text(topMover.name)
                .font(.subheadline)
                .padding(.leading)
            Spacer()
            Text(topMover.change)
                .font(.subheadline)
                .foregroundColor(topMover.change.contains("+") ? .green : .red)
                .padding(.trailing)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 5)
        .padding(.vertical, 2)
    }
}

struct MyWalletView_Previews: PreviewProvider {
    static var previews: some View {
        MyWalletView()
    }
}
