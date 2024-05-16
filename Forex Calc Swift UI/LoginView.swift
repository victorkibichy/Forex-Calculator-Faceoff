import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isSignUpViewPresented = false
    @State private var isResetPasswordPagePresented = false // State to control the presentation of the ResetPasswordPage
    @State private var isDashboardScreenPresented = false // State to control the presentation of the DashboardScreen
    
    var body: some View {
        NavigationView { // Wrap the VStack in a NavigationView
            VStack {
                Image("forexapp")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                Text("Login")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white) // Change text color to white for better contrast
                
                TextField("Username", text: $username)
                    .padding()
                    .background(Color.white.opacity(0.7)) // Adjust background color for contrast
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.white.opacity(0.7)) // Adjust background color for contrast
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                Button(action: {
                    // Handle login button action
                    // Here you can perform validation and authentication
                    print("Username: \(username)")
                    print("Password: \(password)")
                    
                    // Set isDashboardScreenPresented to true to navigate to the DashboardScreen
                    isDashboardScreenPresented = true
                }) {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.pink)
                        .cornerRadius(8)
                        .padding(.horizontal)
                }
                .padding(.bottom, 16) // Add some bottom padding to the button
                
                Button(action: {
                    // Open the sign-up view
                    isSignUpViewPresented = true
                }) {
                    Text("Don't have a profile? Sign Up")
                        .foregroundColor(.black) // Change text color to white for better contrast
                        .padding(.top, 8)
                }
                .sheet(isPresented: $isSignUpViewPresented) {
                    SignUpView()
                }
                
                Button(action: {
                    // Navigate to the ResetPasswordPage
                    isResetPasswordPagePresented = true
                }) {
                    Text("Forgot Password?")
                        .foregroundColor(.black) // Change text color to white for better contrast
                        .padding(.top, 8)
                }
                .sheet(isPresented: $isResetPasswordPagePresented) {
                    ResetPasswordPage()
                }
                
                Spacer()
            }
            .padding()
            .navigationBarHidden(true) // Hide the navigation bar
            .navigationBarTitle("", displayMode: .inline) // Set the navigation title to empty
            .navigationBarBackButtonHidden(true) // Hide the back button
            .navigationBarTitleDisplayMode(.inline) // Set the navigation title display mode
            .background(Color.teal.edgesIgnoringSafeArea(.all)) // Set the background color to teal
            .fullScreenCover(isPresented: $isDashboardScreenPresented) {
                DashboardView()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
