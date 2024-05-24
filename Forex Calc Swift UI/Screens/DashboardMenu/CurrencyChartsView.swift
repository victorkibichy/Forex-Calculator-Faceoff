//
//  CurrencyChartsView.swift
//  Forex Calc Swift UI
//
//  Created by  Bouncy Baby on 5/24/24.
//

import Foundation
import SwiftUI

struct CurrencyChartsView: View {
    var body: some View {
        VStack {
            Text("Currency Charts")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            // Placeholder for charts
            Spacer()
            Text("Charts will be displayed here.")
                .foregroundColor(.gray)
                .padding()
            Spacer()
        }
        .navigationTitle("Currency Charts")
    }
}

struct CurrencyChartsView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyChartsView()
    }
}
