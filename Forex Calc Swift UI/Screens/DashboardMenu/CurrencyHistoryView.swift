import SwiftUI



struct CurrencyHistoryView: View {
    @Binding var conversionHistory: [ConversionHistory]
    
    var body: some View {
        
        NavigationView {
            List(conversionHistory.suffix(5).reversed()) { history in
                VStack(alignment: .leading) {
                    Text("\(history.amount) \(history.fromCurrency) to \(history.toCurrency)")
                        .font(.headline)
                    Text("Result: \(history.result)")
                        .font(.subheadline)
                    Text("Date: \(history.date, style: .date) \(history.date, style: .time)")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 5)
            }
            .navigationTitle("Recent Conversions")
        }
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
