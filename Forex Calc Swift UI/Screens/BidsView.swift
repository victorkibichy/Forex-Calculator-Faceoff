import Foundation
import SwiftUI

// Model representing a forex exchange rate
struct ForexRate: Identifiable {
    var id = UUID()
    var currencyPair: String
    var rate: Double
}

// View for displaying and interacting with forex rates
struct BidsView: View {
    // Sample forex rates for demonstration
    let forexRates: [ForexRate] = [
        ForexRate(currencyPair: "USD/EUR", rate: 0.9241),
        ForexRate(currencyPair: "USD/JPY", rate: 156.8882),
        ForexRate(currencyPair: "USD/GBP", rate: 0.7869),
        // Add more pairs as needed
    ]
    
    var body: some View {
        NavigationView {
            List(forexRates) { rate in
                NavigationLink(destination: PlaceBidView(forexRate: rate)) {
                    VStack(alignment: .leading) {
                        Text(rate.currencyPair)
                            .font(.headline)
                            .foregroundColor(.teal)
                        Text("Rate: \(rate.rate, specifier: "%.4f")")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Forex Rates")
        }
    }
}

// View for placing a bid offer on a forex rate
struct PlaceBidView: View {
    var forexRate: ForexRate
    @State private var bidAmount: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Place a Bid for \(forexRate.currencyPair)")
                .font(.largeTitle)
                .foregroundColor(.teal)
            
            Text("Current Rate: \(forexRate.rate, specifier: "%.4f")")
                .font(.title2)
                .foregroundColor(.gray)
            
            TextField("Enter your bid amount", text: $bidAmount)
                .keyboardType(.decimalPad)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.horizontal)
            
            Button(action: {
                // Handle bid submission
                print("Bid Submitted: \(bidAmount) for \(forexRate.currencyPair)")
            }) {
                Text("Submit Bid")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.teal)
                    .cornerRadius(8)
                    .padding(.horizontal)
            }
            
            Spacer()
        }
        .padding()
    }
}

struct BidsView_Previews: PreviewProvider {
    static var previews: some View {
        BidsView()
    }
}
