import Foundation

struct ExchangeRate {
    let code: String
    let rate: Double
}

class CurrencyConverterViewModel: ObservableObject {
    private var baseCurrencyCode: String
    private var exchangeRates: [ExchangeRate]
    
    init(baseCurrencyCode: String, exchangeRates: [String: Double]) {
        self.baseCurrencyCode = baseCurrencyCode
        self.exchangeRates = exchangeRates.map { ExchangeRate(code: $0.key, rate: $0.value) }
    }
    
    func convert(amount: Double, fromCurrencyCode: String, toCurrencyCode: String) -> Double? {
        guard let fromRate = exchangeRates.first(where: { $0.code == fromCurrencyCode })?.rate,
              let toRate = exchangeRates.first(where: { $0.code == toCurrencyCode })?.rate else {
            return nil
        }
        
        // this is to Convert amount from 'fromCurrency' to 'baseCurrency' first
        let amountInBaseCurrency = amount / fromRate
        
        // Convert amount from 'baseCurrency' to 'toCurrency'
        let convertedAmount = amountInBaseCurrency * toRate
        
        return convertedAmount
    }
    
    var allCurrencies: [String] {
        return exchangeRates.map { $0.code }
    }
}
