import SwiftUI

struct ProfileView: View {
    
    var userName: String
    var currency: String

    var body: some View {
        
        NavigationStack {
            VStack(alignment: .leading) {
                Text("User Profile")
                    .font(.title)
                    .padding(.bottom, 10)
                    .foregroundColor(.white) // Set text color to white
                
                Text("Name:  \(userName)")
                    .padding(.bottom, 5)
                    .foregroundColor(.black) // Set text color to white
                
                Text("Currency: \(currency)")
                    .padding(.bottom, 20)
                    .foregroundColor(.black) // Set text color to white
                
            }
            .padding()
        }
        .background(Color.teal) // Set background color of the entire screen to teal
        .edgesIgnoringSafeArea(.all) // Ignore safe area to cover the entire screen
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(userName: "Kibichy V", currency: "USD")
    }
}
