//
//  MyAccountView.swift
//  Forex Calc Swift UI
//
//  Created by  Bouncy Baby on 6/10/24.
//

import Foundation
import SwiftUI

struct MyAccountView: View {
    var body: some View {
        VStack {
//            the following image function fetches an image from url
            
            AsyncImage(url: URL(string: "https://pbs.twimg.com/media/EORYblKX0AAJedB?format=jpg&name=medium")) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .overlay(
                            Circle().stroke(Color.orange, lineWidth: 4)
                        )
                        .shadow(radius: 10)
                        .padding(.top, 20)
                } else if phase.error != nil {
                    // Placeholder for error
                    Image("myprofile")// Show red color in case of error
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .overlay(
                            Circle().stroke(Color.orange, lineWidth: 4)
                        )
                        .shadow(radius: 10)
                        .padding(.top, 20)
                } else {
                    // Placeholder while loading
                    ProgressView()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .overlay(
                            Circle().stroke(Color.orange, lineWidth: 4)
                        )
                        .shadow(radius: 10)
                        .padding(.top, 20)
                }
            }
            
            // User Name and Role
            Text("Kibichy V")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top, 10)
            
            Text("iOS Designer")
                .font(.subheadline)
                .foregroundColor(.black.opacity(0.9))
                .padding(.bottom, 20)
            
            Spacer()
            // Action Buttons Grid
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 20) {
                ActionButton(imageName: "person.circle.fill", title: "Profile", color: .white)
                
                ActionButton(imageName: "message.circle.fill", title: "Chat", color: .white)
                
                ActionButton(imageName: "heart.circle.fill", title: "Wishlist", color: .white)
                
                ActionButton(imageName: "gearshape.circle.fill", title: "Settings", color: .white)
                
                ActionButton(imageName: "bell.circle.fill", title: "Notifications", color: .white)
                
                ActionButton(imageName: "arrow.right.circle.fill", title: "Logout", color: .white)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.orange.opacity(0.85))
                    .shadow(radius: 10)
            )
            .padding(.top, 20)
            .padding(.horizontal, 30)
        }
        .background(Color.teal.edgesIgnoringSafeArea(.all))
    }
}

struct ActionButton: View {
    var imageName: String
    var title: String
    var color: Color
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .font(.largeTitle)
                .foregroundColor(color)
            
            Text(title)
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundColor(.black)
        }
    }
}

struct MyAccountView_Previews: PreviewProvider {
    static var previews: some View {
        MyAccountView()
    }
}
