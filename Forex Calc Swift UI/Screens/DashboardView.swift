//
//  CurrencyData.swift
//  Forex Calc Swift UI
//
//  Created by  Bouncy Baby on 5/27/24.
//
import SwiftUI

struct DashboardView: View {
    var body: some View {
        NavigationStack {
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
                        }
                        else if cardTitles[index] == "Currency Charts" {
                                                    NavigationLink(destination: CurrencyChartsView()) {
                                                        CardView(title: cardTitles[index], imageName: imageNames[index])
                                                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                                                            .background(Color.white.opacity(0.8))
                                                            .cornerRadius(10)
                                                            .shadow(radius: 5)
                            }
                        }
                        
                        else if cardTitles[index] == "Currency History" {
                            NavigationLink(destination: CurrencyListView()) {
                                CardView(title: cardTitles[index], imageName: imageNames[index])
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .background(Color.white.opacity(0.8))
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                            }
                        }
                        
                        else if cardTitles[index] == "Business to Business" {
                            NavigationLink(destination: BusinessToBusinessView()) {
                                CardView(title: cardTitles[index], imageName: imageNames[index])
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .background(Color.white.opacity(0.8))
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                            }
                        } else if cardTitles[index] == "Business to Consumers" {
                            NavigationLink(destination: BusinessToConsumersView()) {
                                CardView(title: cardTitles[index], imageName: imageNames[index])
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .background(Color.white.opacity(0.8))
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                            }
                        } else if cardTitles[index] == "Business to Business to Consumer" {
                            NavigationLink(destination: BusinessToBusinessToConsumerView()) {
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
            .background(Color.teal.edgesIgnoringSafeArea(.all))
        }
    }
    
    let cardTitles = ["My Wallet", "Quick Convert", "Currency Charts", "Currency History", "Business to Business", "Business to Consumers", "Business to Business to Consumer"]
    let imageNames = ["mywallet", "convert", "currencychart", "currencyhistory", "business", "consumers", "businessconsumer"]
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
                .foregroundColor(.purple)
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
    case currencyCharts = "Currency Charts"
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
            return AnyView(CurrencyChartsView())
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
