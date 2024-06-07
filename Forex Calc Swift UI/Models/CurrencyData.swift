//
//  CurrencyData.swift
//  Forex Calc Swift UI
//
//  Created by  Bouncy Baby on 5/27/24.
//

import Foundation

// Model for the individual result
struct CurrencyResult: Codable {
    let close: Double
    let high: Double
    let low: Double
    let numTrades: Int
    let open: Double
    let timestamp: Int64
    let volume: Int
    let vwap: Double
    
    enum CodingKeys: String, CodingKey {
        case close = "c"
        case high = "h"
        case low = "l"
        case numTrades = "n"
        case open = "o"
        case timestamp = "t"
        case volume = "v"
        case vwap = "vw"
    }
}

// Main model to reflect the overall response structure
struct CurrencyData: Codable {
    let adjusted: Bool
    let queryCount: Int
    let requestId: String
    let results: [CurrencyResult]
    let resultsCount: Int
    let status: String
    let ticker: String
    
    enum CodingKeys: String, CodingKey {
        case adjusted
        case queryCount
        case requestId = "request_id"
        case results
        case resultsCount
        case status
        case ticker
    }
}

