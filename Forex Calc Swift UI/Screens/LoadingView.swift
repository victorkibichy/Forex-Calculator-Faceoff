//
//  LoadingView.swift
//  Forex Calc Swift UI
//
//  Created by  Bouncy Baby on 6/10/24.
//

import Foundation


import SwiftUI
struct LoadingView: View {
    var body: some View {
        ZStack {
            
            Color(.systemTeal).edgesIgnoringSafeArea(.all)
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .black))
                .scaleEffect(2)
            
            
            
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
