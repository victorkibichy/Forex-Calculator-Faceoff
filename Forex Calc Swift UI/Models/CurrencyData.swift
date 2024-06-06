//
//  CurrencyData.swift
//  Forex Calc Swift UI
//
//  Created by  Bouncy Baby on 5/27/24.
//

import Foundation

struct CurrencyData: Decodable {
    let base: String
    let date: String
    let rates: [String: Double]
}


