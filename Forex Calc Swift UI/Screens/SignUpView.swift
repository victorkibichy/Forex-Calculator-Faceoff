//
//  CurrencyData.swift
//  Forex Calc Swift UI
//
//  Created by Bouncy Baby on 5/27/24.
//
import SwiftUI

struct SignUpView: View {
    // User input state variables
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var nationalID: String = ""
    @State private var email: String = ""
    @State private var phoneNumber: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var selectedCurrency: String = "KES" // Default selection for the currency

    // List of currencies sorted alphabetically
    let currencies: [String] = [
        "AED", "AFN", "ALL", "AMD", "ANG", "AOA", "ARS", "AUD", "AWG", "AZN",
        "BAM", "BBD", "BDT", "BGN", "BHD", "BIF", "BMD", "BND", "BOB", "BRL",
        "BSD", "BTN", "BWP", "BYN", "BZD", "CAD", "CDF", "CHF", "CLP", "CNY",
        "COP", "CRC", "CUP", "CVE", "CZK", "DJF", "DKK", "DOP", "DZD", "EGP",
        "ERN", "ETB", "EUR", "FJD", "FKP", "FOK", "GBP", "GEL", "GGP", "GHS",
        "GIP", "GMD", "GNF", "GTQ", "GYD", "HKD", "HNL", "HRK", "HTG", "HUF",
        "IDR", "ILS", "IMP", "INR", "IQD", "IRR", "ISK", "JEP", "JMD", "JOD",
        "JPY", "KES", "KGS", "KHR", "KID", "KMF", "KRW", "KWD", "KYD", "KZT",
        "LAK", "LBP", "LKR", "LRD", "LSL", "LYD", "MAD", "MDL", "MGA", "MKD",
        "MMK", "MNT", "MOP", "MRU", "MUR", "MVR", "MWK", "MXN", "MYR", "MZN",
        "NAD", "NGN", "NIO", "NOK", "NPR", "NZD", "OMR", "PAB", "PEN", "PGK",
        "PHP", "PKR", "PLN", "PYG", "QAR", "RON", "RSD", "RUB", "RWF", "SAR",
        "SBD", "SCR", "SDG", "SEK", "SGD", "SHP", "SLE", "SLL", "SOS", "SRD",
        "SSP", "STN", "SYP", "SZL", "THB", "TJS", "TMT", "TND", "TOP", "TRY",
        "TTD", "TVD", "TWD", "TZS", "UAH", "UGX", "USD", "UYU", "UZS", "VES",
        "VND", "VUV", "WST", "XAF", "XCD", "XDR", "XOF", "XPF", "YER", "ZAR",
        "ZMW", "ZWL"
    ].sorted() // Sorting currencies alphabetically

    var body: some View {
        ScrollView {
            VStack {
                Text("Sign Up")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                
                // User input fields
                TextField("First Name", text: $firstName)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                TextField("Last Name", text: $lastName)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                TextField("National ID", text: $nationalID)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                TextField("Email", text: $email)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                TextField("Phone Number", text: $phoneNumber)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .keyboardType(.phonePad) // Set keyboard type to phone pad
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                SecureField("Confirm Password", text: $confirmPassword)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                // Currency picker
                VStack {
                    Text("Select Currency")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .padding(.top)
                    
                    Picker("Currency", selection: $selectedCurrency) {
                        ForEach(currencies, id: \.self) { currency in
                            Text(currency).tag(currency)
                        }
                    }
                    .pickerStyle(MenuPickerStyle()) // Using MenuPickerStyle for a dropdown menu
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.horizontal)
                }
                
                // Sign up button
                Button(action: {
                    // Handle sign up button action
                    // Here you can perform validation and send email confirmation
                    
                    print("Sign Up button tapped")
                    print("First Name: \(firstName)")
                    print("Last Name: \(lastName)")
                    print("National ID: \(nationalID)")
                    print("Email: \(email)")
                    print("Phone Number: \(phoneNumber)")
                    print("Password: \(password)")
                    print("Confirm Password: \(confirmPassword)")
                    print("Selected Currency: \(selectedCurrency)")
                }) {
                    Text("Sign Up")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(8)
                        .padding(.horizontal)
                }
            }
            .padding()
            
        } 
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
