//
//  CurrencyHistory.swift
//  Forex Calc Swift UI
//
//  Created by  Bouncy Baby on 6/6/24.
//

import SwiftUI

struct CurrencyHistoryView: View {
    @Binding var conversionHistory: [ConversionHistory]
    
    var body: some View {
        List(conversionHistory) { history in
            VStack(alignment: .leading) {
                Text("\(history.amount) \(history.fromCurrency) to \(history.toCurrency)")
                Text("Result: \(history.result)")
                Text("Date: \(history.date, style: .date) \(history.date, style: .time)")
            }
        }
        .navigationTitle("Conversion History")
    }
}



struct CurrencyHistoryView_Previews: PreviewProvider {
    @State static var sampleHistory = [
        ConversionHistory(fromCurrency: "USD", toCurrency: "EUR", amount: 100.0, result: 90.0, date: Date()),
        ConversionHistory(fromCurrency: "GBP", toCurrency: "USD", amount: 50.0, result: 70.0, date: Date().addingTimeInterval(-86400)),
        ConversionHistory(fromCurrency: "JPY", toCurrency: "INR", amount: 10000.0, result: 6800.0, date: Date().addingTimeInterval(-172800))
    ]
    
    static var previews: some View {
        CurrencyHistoryView(conversionHistory: $sampleHistory)
    }
}
