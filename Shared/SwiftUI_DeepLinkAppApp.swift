//
//  SwiftUI_DeepLinkAppApp.swift
//  Shared
//
//  Created by park kyung seok on 2022/06/25.
//

import SwiftUI

@main
struct SwiftUI_DeepLinkAppApp: App {
    
    @StateObject var appDataViewModel: AppDataViewModel = AppDataViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appDataViewModel)
                .onOpenURL { url in
                    
                    if appDataViewModel.checkDeepLink(url: url) {
                        print("From Deep Link")
                        
                        
                    } else {
                        print("Fall back Deep Link")
                    }
                }
        }
    }
}
