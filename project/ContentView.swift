//
//  ContentView.swift
//  project
//
//  Created by DPI Student 145 on 7/10/25.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        TabView {
        HomeScreen()
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
        TaskDeck()
            .tabItem {
                Image(systemName: "sparkles.rectangle.stack")
                Text("Task Decks")
            }
        Progress()
            .tabItem {
                Image(systemName: "trophy")
                Text("Progress")
            }
        TabTwo()
            .tabItem {
                Image(systemName: "person.3")
                Text("Social")
            }
        Profile()
            .tabItem {
                Image(systemName: "person")
                Text("Profile")
            }
            
        }
        .accentColor(purpleColor)

       
    }
}

#Preview {
    ContentView()
}
