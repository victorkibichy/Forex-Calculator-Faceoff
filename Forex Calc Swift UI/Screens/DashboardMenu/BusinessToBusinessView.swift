//
//  BusinessToBusinessView.swift
//  Forex Calc Swift UI
//
//  Created by  Bouncy Baby on 6/6/24.
//

import Foundation
import SwiftUI

struct BusinessToBusinessView: View {
    var body: some View {
        VStack {
            Text("Welcome to the Business to Business section")
                .font(.title)
                .padding()
            
            Text("Here you can find all the tools and resources for your B2B needs.")
                .padding()
            
            // Add more content relevant to Business to Business here
        }
        .navigationTitle("Business to Business")
        .padding()
    }
}

struct BusinessToBusinessView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessToBusinessView()
    }
}
