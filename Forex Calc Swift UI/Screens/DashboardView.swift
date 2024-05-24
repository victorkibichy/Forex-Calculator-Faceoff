import SwiftUI

struct DashboardView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(), count: 2), spacing: 20) {
                    ForEach(0..<cardTitles.count, id: \.self) { index in
                        if cardTitles[index] == "My Wallet" {
                            NavigationLink(destination: MyWalletView()) {
                                CardView(title: cardTitles[index], imageName: imageNames[index])
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .background(Color.white.opacity(0.8))
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                            }
                        } else if cardTitles[index] == "Quick Convert" {
                            NavigationLink(destination: QuickConvertView()) {
                                CardView(title: cardTitles[index], imageName: imageNames[index])
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .background(Color.white.opacity(0.8))
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                            }
                        } else if cardTitles[index] == "Currency Charts" { // New navigation link for Currency Charts
                            NavigationLink(destination: CurrencyChartsView()) {
                                CardView(title: cardTitles[index], imageName: imageNames[index])
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .background(Color.white.opacity(0.8))
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                            }
                        } else {
                            CardView(title: cardTitles[index], imageName: imageNames[index])
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(Color.white.opacity(0.8))
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        }
                    }
                }
                .padding(20)
            }
            .navigationTitle("Dashboard")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    DrawerMenuButton()
                }
            }
            .background(Color.teal.edgesIgnoringSafeArea(.all)) // Set the background color to teal
        }
    }
    
    let cardTitles = ["My Wallet", "Quick Convert", "Currency Charts", "Currency History"]
    let imageNames = ["mywallet", "convert", "currencychart", "currencyhistory"]
}

struct CardView: View {
    var title: String
    var imageName: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(10)
            
            Text(title)
                .foregroundColor(.black)
                .font(.headline)
                .padding()
                .fontWeight(.semibold)
        }
    }
}

struct DrawerMenuButton: View {
    var body: some View {
        NavigationLink(destination: DrawerMenuView()) {
            Image(systemName: "line.horizontal.3")
                .font(.title)
                .foregroundColor(.white) // Adjusted color for better visibility
                .padding()
        }
    }
}

struct DrawerMenuView: View {
    @State private var selectedMenuItem: MenuItem? = nil
    
    var body: some View {
        List {
            ForEach(MenuItem.allCases, id: \.self) { item in
                NavigationLink(
                    destination: item.destinationView,
                    tag: item,
                    selection: $selectedMenuItem
                ) {
                    Text(item.rawValue)
                }
            }
        }
        .navigationTitle("Menu")
    }
}

enum MenuItem: String, CaseIterable {
    case profile = "My Profile"
    case myAccount = "My Account"
    case settings = "Settings"
    case currencyCharts = "Currency Charts" // New case
    case logout = "Logout"
    
    var destinationView: some View {
        switch self {
        case .profile:
            return AnyView(ProfileView())
        case .myAccount:
            return AnyView(MyAccountView())
        case .settings:
            return AnyView(SettingsView())
        case .currencyCharts:
            return AnyView(CurrencyChartsView()) // New view
        case .logout:
            return AnyView(LoginView())
        }
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Profile View")
    }
}

struct MyAccountView: View {
    var body: some View {
        Text("My Account View")
    }
}

struct SettingsView: View {
    var body: some View {
        Text("Settings View")
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}