//
//  AppDataViewModel.swift
//  SwiftUI_DeepLinkApp (iOS)
//
//  Created by park kyung seok on 2022/06/25.
//

import SwiftUI

class AppDataViewModel: ObservableObject {
   
    @Published var currentTab: Tab = .home
    @Published var currentDetailPage: String?
    
    func checkDeepLink(url: URL) -> Bool {
        
        guard let host = URLComponents(url: url, resolvingAgainstBaseURL: true)?.host else { return false }
        
        // coffeeapp://home or search or settingsの場合
        if host == Tab.home.rawValue {
            currentTab = .home
        } else if host == Tab.search.rawValue {
            currentTab = .search
        } else if host == Tab.settings.rawValue {
            currentTab = .settings
        } else {
            
            // その他、searchのdeeplinkかどうかを確認
            return checkInternalLinks(host: host)
        }
        
        return true
    }
    
    func checkInternalLinks(host: String) -> Bool {
        
        if let index = coffees.firstIndex(where: { coffee in
            return coffee.id == host
        }) {
            // ここでは DeepLinkで遷移する画面は Searchのみとなるので coffee.id == hostがマッチした場合には searchタブにする
            currentTab = .search
            
            currentDetailPage = coffees[index].id
            return true
            
        }
        
        return false
    }
}

enum Tab: String {
    case home = "home"
    case search = "search"
    case settings = "settings"
}
