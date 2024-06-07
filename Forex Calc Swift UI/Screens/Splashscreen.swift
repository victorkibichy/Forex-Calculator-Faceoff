//
//  CurrencyData.swift
//  Forex Calc Swift UI
//
//  Created by  Bouncy Baby on 5/27/24.
//
import SwiftUI

struct Splashscreen: View {
    @State private var isLoginViewPresented = false
    @State private var isImageVisible = true
    
    var body: some View {
        ZStack {
            // Set the background color to teal
            Color.teal
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Welcome To Forex Faceoff")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                if isImageVisible {
                    Image("forexapp")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                        .onAppear {
                            // Hide the image after two seconds
                            Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
                                isImageVisible = false
                                isLoginViewPresented = true
                            }
                        }
                } else {
                    EmptyView()
                }
                
                Button(action: {
                    // Open the login view
                    isLoginViewPresented = true
                }) {
                    Text("Get Started")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                        .padding(.top, 20)
                }
                .sheet(isPresented: $isLoginViewPresented) {
                    LoginView()
                }
            }
            .padding()
        }
    }
}

struct Splashscreen_Previews: PreviewProvider {
    static var previews: some View {
        Splashscreen()
    }
}
