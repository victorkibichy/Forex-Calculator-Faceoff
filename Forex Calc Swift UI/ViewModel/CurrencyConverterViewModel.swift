//
//  CurrencyConverterViewModel.swift
//  Forex Calc Swift UI
//
//  Created by  Bouncy Baby on 5/24/24.
//

import Foundation

struct ExchangeRate {
    let code: String
    let rate: Double
}

class CurrencyConverterViewModel {
    private var baseCurrencyCode: String
    private var exchangeRates: [ExchangeRate]
    
    init(baseCurrencyCode: String, exchangeRates: [String: Double]) {
        self.baseCurrencyCode = baseCurrencyCode
        self.exchangeRates = exchangeRates.map { ExchangeRate(code: $0.key, rate: $0.value) }
    }
    
    func convert(amount: Double, fromCurrencyCode: String, toCurrencyCode: String) -> Double? {
        guard let fromRate = exchangeRates.first(where: { $0.code == fromCurrencyCode }),
              let toRate = exchangeRates.first(where: { $0.code == toCurrencyCode }) else {
            return nil
        }
        
        // Convert amount from 'fromCurrency' to 'baseCurrency' first
        let amountInBaseCurrency = amount / fromRate.rate
        
        // Convert amount from 'baseCurrency' to 'toCurrency'
        let convertedAmount = amountInBaseCurrency * toRate.rate
        
        return convertedAmount
    }
}
