import SwiftUI

struct ConversionView: View {
    @State private var amount = ""
    @State private var fromCurrency = "USD"
    @State private var toCurrency = "EUR"
    @State private var convertedAmount: Double?
    
    let currencies = ["USD", "EUR", "GBP", "JPY", "AUD"]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Amount")) {
                    TextField("Enter amount", text: $amount)
                        .keyboardType(.decimalPad)
                }

                Section(header: Text("From Currency")) {
                    Picker("From Currency", selection: $fromCurrency) {
                        ForEach(currencies, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                Section(header: Text("To Currency")) {
                    Picker("To Currency", selection: $toCurrency) {
                        ForEach(currencies, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                Section {
                    Button(action: convert) {
                        Text("Convert")
                    }
                }

                if let convertedAmount = convertedAmount {
                    Section(header: Text("Converted Amount")) {
                        Text("\(convertedAmount, specifier: "%.2f") \(toCurrency)")
                    }
                }
            }
            .navigationBarTitle("Forex Converter")
        }
    }

    func convert() {
        // Mock conversion logic for demonstration purposes
        let amountInDouble = Double(amount) ?? 0.0
        let conversionRate = 0.85 // Mock conversion rate
        convertedAmount = amountInDouble * conversionRate
    }
}

struct ConversionView_Previews: PreviewProvider {
    static var previews: some View {
        ConversionView()
    }
}
