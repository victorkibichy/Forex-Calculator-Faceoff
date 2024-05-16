//
//  Splashscreen.swift
//  Forex Calc Swift UI
//
//  Created by  Bouncy Baby on 5/16/24.
//

import SwiftUI

struct Splashscreen: View {
    @State private var isLoginViewPresented = false
    @State private var isImageVisible = true
    
    var body: some View {
        VStack {
          
            
            if isImageVisible {
                Image("splashscreen")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
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
                // Open the sign-up view
                isLoginViewPresented = true
            }) {
               
            }
            .padding()
            .sheet(isPresented: $isLoginViewPresented) {
                LoginView()
            }
        }
    }
}

struct Splashscreen_Previews: PreviewProvider {
    static var previews: some View {
        Splashscreen()
    }
}
