import SwiftUI

struct ProfileView: View {
    var userName: String
    var currency: String

    var body: some View {
        VStack(alignment: .leading) {
            Text("User Profile")
                .font(.title)
                .padding(.bottom, 10)
            
            Text("Name: \(userName)")
                .padding(.bottom, 5)
            
            Text("Currency: \(currency)")
                .padding(.bottom, 20)
            
            
        }
        .padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(userName: "Kibichy V", currency: "USD")
    }
}
