//
//  CurrencyDataService.swift
//  Forex Calc Swift UI
//
//  Created by  Bouncy Baby on 6/7/24.
//

import Foundation

class CurrencyDataService {
    let apiKey = "2VbURjjrrKQG5F1hgNc4xm85eogWSFvY"
    
    func fetchCurrencyData(completion: @escaping (Result<CurrencyData, Error>) -> Void) {
        let urlString = "https://api.polygon.io/v2/aggs/ticker/C:EURUSD/prev?apiKey=\(apiKey)"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                print("No data")
                return
            }
            
            do {
                let responseData = try JSONDecoder().decode(CurrencyData.self, from: data)
                completion(.success(responseData))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
