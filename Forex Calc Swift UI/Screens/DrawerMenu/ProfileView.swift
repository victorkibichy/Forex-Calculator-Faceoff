//
//  MyAccountView.swift
//  Forex Calc Swift UI
//
//  Created by  Bouncy Baby on 6/10/24.
//

import SwiftUI

struct ProfileView: View {
    // Connect the ViewModel to the View
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("User Profile")
                    .font(.title)
                    .padding(.bottom, 10)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                
                Text("Name: \(viewModel.userProfile.name)")
                    .padding(.bottom, 5)
                    .foregroundColor(.black)
                
                Text("Currency: \(viewModel.userProfile.currency)")
                    .padding(.bottom, 20)
                    .foregroundColor(.black)
                
                // Example button to change user data
                Button(action: {
                    // Update user data in ViewModel
                    viewModel.updateUserProfile(name: "Jane Doe", currency: "EUR")
                }) {
                    Text("Update Profile")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .padding()
            
            .foregroundColor(.white)
            .edgesIgnoringSafeArea(.all)
        }
        
        
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel())
    }
}
