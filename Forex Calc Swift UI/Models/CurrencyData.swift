//
//  CurrencyData.swift
//  Forex Calc Swift UI
//
//  Created by  Bouncy Baby on 5/27/24.
//

import Foundation

struct CurrencyData: Codable {
    let ticker: String
    let lastTradePrice: Double
    let lastTradeTimestamp: Int64
    
    enum CodingKeys: String, CodingKey {
        case ticker = "T"
        case lastTradePrice = "p"
        case lastTradeTimestamp = "t"
    }
}
