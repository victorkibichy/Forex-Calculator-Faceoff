//
//  MyAccountView.swift
//  Forex Calc Swift UI
//
//  Created by  Bouncy Baby on 6/10/24.
//

//
//  ProfileView.swift
//  Forex Calc Swift UI
//
//  Created by Bouncy Baby on 6/10/24.
//

//
//  ProfileView.swift
//  Forex Calc Swift UI
//
//  Created by Bouncy Baby on 6/10/24.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            // Profile Picture
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
                    Image("myprofile") // Use a local placeholder image
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
            .onTapGesture {
                // Action for editing profile picture
                editProfilePicture()
            }
            
            // User Name and Role
            Text("Kibichy Victor")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top, 10)
            
            Text("iOS Developer")
                .font(.subheadline)
                .foregroundColor(.black.opacity(0.9))
                .padding(.bottom, 20)
            
            Spacer()
            
            // Profile Options Grid
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 20) {
                NavigationLink(destination: ChangeCurrencyView()) {
                    ProfileOptionButton(imageName: "dollarsign.circle.fill", title: "Change Currency", color: .white)
                }
                NavigationLink(destination: EditLocationView()) {
                    ProfileOptionButton(imageName: "location.circle.fill", title: "Edit Location", color: .white)
                }
                Button(action: {
                    editProfilePicture()
                }) {
                    ProfileOptionButton(imageName: "camera.circle.fill", title: "Edit Profile Picture", color: .white)
                }
                NavigationLink(destination: ChangeLanguageView()) {
                    ProfileOptionButton(imageName: "globe", title: "Change Language", color: .white)
                }
                NavigationLink(destination: EditProfileDetailsView()) {
                    ProfileOptionButton(imageName: "person.circle.fill", title: "Edit Profile Details", color: .white)
                }
                NavigationLink(destination: SettingsView()) {
                    ProfileOptionButton(imageName: "gearshape.circle.fill", title: "Account Settings", color: .white)
                }
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
    
    func editProfilePicture() {
        // Action to edit the profile picture
        print("Edit profile picture action")
    }
}

struct ProfileOptionButton: View {
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
        .padding()
    }
}

// Placeholder Views for the options
struct ChangeCurrencyView: View {
    var body: some View {
        Text("Change Currency View")
            .font(.largeTitle)
            .foregroundColor(.teal)
    }
}

struct EditLocationView: View {
    var body: some View {
        Text("Edit Location View")
            .font(.largeTitle)
            .foregroundColor(.teal)
    }
}

struct ChangeLanguageView: View {
    var body: some View {
        Text("Change Language View")
            .font(.largeTitle)
            .foregroundColor(.teal)
    }
}

struct EditProfileDetailsView: View {
    var body: some View {
        Text("Edit Profile Details View")
            .font(.largeTitle)
            .foregroundColor(.teal)
    }
}



struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
