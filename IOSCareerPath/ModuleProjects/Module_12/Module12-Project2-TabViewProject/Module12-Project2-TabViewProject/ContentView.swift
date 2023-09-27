//
//  ContentView.swift
//  Module12-Project2-TabViewProject
//
//  Created by Alex Archer on 8/21/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("Home View")
            .tabItem {
                Label("Home", systemImage: "house")
            }
            Text("Profile View")
            .tabItem {
                Label("Profile", systemImage: "person.circle.fill")
            }
            
        }.tabViewStyle(PageTabViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
