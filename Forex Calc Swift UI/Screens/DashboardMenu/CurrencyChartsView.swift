import SwiftUI

struct CurrencyChartsView: View {
    @State private var amount: String = ""
    @State private var sourceCurrency: String = "USD"
    @State private var targetCurrency: String = "EUR"
    @State private var convertedAmount: Double?
    
    // Initialize CurrencyConverterViewModel
    let viewModel = CurrencyConverterViewModel(baseCurrencyCode: "USD", exchangeRates: [
        "USD": 1,
        "EUR": 0.9241,
        // Add other exchange rates...
    ])
    
    // Extracted currencies and exchange rates from the provided JSON
    let currencies = [
        "USD": 1,
        "AED": 3.6725,
        "AFN": 71.8772,
        // Add other currencies...
    ]
    
    var body: some View {
        VStack {
            Text("Currency Charts")
                .font(.body)
                .fontWeight(.bold)
                .padding()
            
            // Input fields
            TextField("Amount", text: $amount)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            // Picker for source currency
            Picker("Source Currency", selection: $sourceCurrency) {
                ForEach(currencies.sorted(by: <), id: \.key) { (currencyCode, exchangeRate) in
                    Text(currencyCode).tag(currencyCode)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            // Picker for target currency
            Picker("Target Currency", selection: $targetCurrency) {
                ForEach(currencies.sorted(by: <), id: \.key) { (currencyCode, exchangeRate) in
                    Text(currencyCode).tag(currencyCode)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            // Button to perform conversion
            Button("Convert") {
                if let amount = Double(amount) {
                    convertedAmount = viewModel.convert(amount: amount, fromCurrencyCode: sourceCurrency, toCurrencyCode: targetCurrency)
                }
            }
            .padding()
            
            // Display converted amount
            if let convertedAmount = convertedAmount {
                Text("Converted Amount: \(convertedAmount, specifier: "%.2f")")
                    .foregroundColor(.green)
                    .padding()
            }
            
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
