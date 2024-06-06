//
//  CurrencyHistory.swift
//  Forex Calc Swift UI
//
//  Created by  Bouncy Baby on 6/6/24.
//

import Foundation

struct ConversionHistory: Identifiable {
    let id = UUID()
    let fromCurrency: String
    let toCurrency: String
    let amount: Double
    let result: Double
    let date: Date
}

