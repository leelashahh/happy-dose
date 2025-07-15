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
            //.toolbarBackground(.white, for: .projectApp)
            //.toolbarBackground(.visible, for: .projectApp)
        TabTwo()
            .tabItem {
                Image(systemName: "person.3")
                Text("Friends")
            }
        TabThree()
            .tabItem {
                Image(systemName: "trophy")
                Text("Progress")
            }
        TabFour()
            .tabItem {
                Image(systemName: "sparkles.rectangle.stack")
                Text("Tasks")
            }
        TabFive()
            .tabItem {
                Image(systemName: "person")
                Text("Profile")
            }
            
        }
       
    }
}

#Preview {
    ContentView()
}
