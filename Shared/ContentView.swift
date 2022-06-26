//
//  ContentView.swift
//  Shared
//
//  Created by park kyung seok on 2022/06/25.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var appDataViewModel: AppDataViewModel
    
    var body: some View {
        Home()
            .environmentObject(appDataViewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
