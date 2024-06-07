//
//  SettingsView.swift
//  Forex Calc Swift UI
//
//  Created by  Bouncy Baby on 6/7/24.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    @State private var notificationEnabled = false
    @State private var notificationInterval = 1
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Notifications")) {
                    Toggle(isOn: $notificationEnabled) {
                        Text("Enable Notifications")
                    }
                    
                    if notificationEnabled {
                        Picker(selection: $notificationInterval, label: Text("Notification Interval")) {
                            Text("Every 1 Hour").tag(1)
                            Text("Every 6 Hours").tag(6)
                            Text("Every 12 Hours").tag(12)
                        }
                    }
                }
                
                Section(header: Text("Account")) {
                    Button(action: {
                        // Add action to edit account details
                    }) {
                        Text("Edit Account Details")
                    }
                }
                
                Section(header: Text("Feedback")) {
                    Button(action: {
                        // Add action to provide feedback
                    }) {
                        Text("Give Feedback")
                    }
                    
                    Button(action: {
                        // Add action to rate the app
                    }) {
                        Text("Rate the App")
                    }
                }
            }
            .navigationBarTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

