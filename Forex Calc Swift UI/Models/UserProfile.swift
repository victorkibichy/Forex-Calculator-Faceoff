//
//  UserProfile.swift
//  Forex Calc Swift UI
//
//  Created by  Bouncy Baby on 6/10/24.
//


import SwiftUI
import Combine

import Foundation

struct UserProfile {
    var name: String
    var currency: String
}

class ProfileViewModel: ObservableObject {
    // The model (data)
    @Published var userProfile: UserProfile
    
    // Initialization with a default user profile
    init() {
        self.userProfile = UserProfile(name: "Kibichy V", currency: "USD")
    }
    
    // Example method to update user profile data
    func updateUserProfile(name: String, currency: String) {
        userProfile.name = name
        userProfile.currency = currency
    }
}

