//
//  Home.swift
//  SwiftUI_DeepLinkApp (iOS)
//
//  Created by park kyung seok on 2022/06/25.
//

import SwiftUI

struct Home: View {
    
    @EnvironmentObject var appDataViewModel: AppDataViewModel
    
    var body: some View {
        
        TabView(selection: $appDataViewModel.currentTab) {
            
            Text("Home")
                .tag(Tab.home)
                .tabItem {
                    Image(systemName: "house.fill")
                }
            
            SearchView()
                .environmentObject(appDataViewModel)
                .tag(Tab.search)
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            
            Text("Settings")
                .tag(Tab.settings)
                .tabItem {
                    Image(systemName: "gearshape.fill")
                }
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct SearchView: View {
    
    @EnvironmentObject var appDataViewModel: AppDataViewModel
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                ForEach(coffees) { coffee in
                    
                    // NavigationLink は PushViewController
                    // 1番目のクロージャの中には遷移する Viewを入れる
                    NavigationLink(tag: coffee.id, selection: $appDataViewModel.currentDetailPage) {
                        DetailView(coffee: coffee)
                    } label: {
                        HStack(spacing: 15) {
                            
                            Image(coffee.productImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 80, height: 80)
                                .cornerRadius(15)
                            
                            VStack(alignment: .leading, spacing: 10) {
                                
                                Text(coffee.title)
                                    .font(.body.bold())
                                    .foregroundColor(.primary)
                                
                                Text(coffee.productPrice)
                                    .font(.callout)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Search")
        }
    }
}

@ViewBuilder
func DetailView(coffee: Coffee) -> some View {
    
    ScrollView(.vertical, showsIndicators: false) {
        
        VStack {
            
            Image(coffee.productImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width - 10, height: 200)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 12) {
                
                Text(coffee.title)
                    .font(.title.bold())
                    .foregroundColor(.primary)
                
                Text(coffee.productPrice)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                
                Text(coffee.description)
                    .multilineTextAlignment(.leading)
            }
            .padding()
        }

    }
    .navigationTitle(coffee.title)
}
