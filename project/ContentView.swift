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
        TabFour()
            .tabItem {
                Image(systemName: "sparkles.rectangle.stack")
                Text("Task Decks")
            }
        TabThree()
            .tabItem {
                Image(systemName: "trophy")
                Text("Progress")
            }
        TabTwo()
            .tabItem {
                Image(systemName: "person.3")
                Text("Social")
            }
        
        
        TabFive()
            .tabItem {
                Image(systemName: "person")
                Text("Profile")
            }
            
        }
<<<<<<< HEAD
//<<<<<<< HEAD
        .ignoresSafeArea(.container, edges: .bottom)
///=======
        .accentColor(purpleColor)

//>>>>>>> 9c81c2a5ace76a18d8fc873eda0f8b55d538c562
=======

        .ignoresSafeArea(.container, edges: .bottom)

        .accentColor(purpleColor)


>>>>>>> c2a4b58615845807241d8dd31401421137a254d6
       
    }
}

#Preview {
    ContentView()
}
