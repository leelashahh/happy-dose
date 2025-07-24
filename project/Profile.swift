//
//  TabFive.swift
//  project
//
//  Created by Ela Agar on 7/14/25.
//

import SwiftUI
import PhotosUI

struct Profile: View {
    
   
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    var body: some View {
        
        NavigationStack{
            VStack {
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                HStack{
 
                    NavigationLink(destination: secondView()){
                        Image(systemName: "person.fill.badge.plus")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .padding()
                            .tint(.black)
                    }
//                    Image(systemName: "person.fill.badge.plus")
//                        .resizable()
//                        .frame(width: 60, height: 60)
//                        .padding()
                    Spacer()
                    
                }
 
//
//
                
                PhotosPicker(
                    selection: $selectedItem,
                    matching: .images,
                    photoLibrary: .shared()
                ) {
                    ZStack(alignment: .bottomTrailing) {
                        if let selectedImageData,
                           let uiImage = UIImage(data: selectedImageData) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .frame(width: 200, height: 140)
                                .clipShape(Circle())
                                .padding(14)
                                .background(
                                        Circle()
                                            .fill(greenColor)
                                            .shadow(radius: 5)
                                    )
                            
                        } else {
                            Image("seflie")
                                .resizable()
                                .frame(width: 200, height: 140)
                                .clipShape(Circle())
                                .padding(14)
                                .background(
                                        Circle()
                                            .fill(greenColor)
                                            .shadow(radius: 5)

                                    )
                        }
                            
                           

                        Image(systemName: "camera.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.black)
                            .background(Color.white.clipShape(Circle()))
                            .offset(x: -30, y: -10)

                    }
                }
                .onChange(of: selectedItem) { newItem in
                    Task {
                        if let data = try? await newItem?.loadTransferable(type: Data.self) {
                            selectedImageData = data
                        }
                    }
                }

              

                Text("@leela.shah")
                    . font(.system(size: 30))
                
                
//                Spacer()
//                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                
                
                VStack{
                    HStack(spacing: 150){
                        Text("13")
                            .fontWeight(.heavy)
                            .font(.system(size:30))
                        
                       
                        Text("6")
                            .fontWeight(.heavy)
                            .font(.system(size: 30))

                        
                    }
                    
                    HStack(spacing: 140){
                        Text("friends")
                            .font(.system(size: 20))
                         

                        VStack{
                            Text("posts")                        .font(.system(size: 20))
                            
                            
                            
                        }
                        
                    }
                }
                .padding()
                .overlay(
                    
                    RoundedRectangle(cornerRadius: 10)

                        .stroke(blueColor, lineWidth: 8)
                        .fill(blueColor.opacity(0.3))
                        //.shadow(radius: 1)

                       
                )
                
                
                 Spacer()
                Spacer()
                
                VStack{
                    Text("Archive").fontWeight(.heavy)
                        .font(.system(size: 30))
                        .padding() // Adds space around the text
                           
                    
                      //  .padding()
                        //.padding()
                    
                    
                     
                     HStack{
                         
                        Image("first")
                            .resizable()
                            .frame(width: 110, height: 110)
                            .border(.black)
                            .cornerRadius(10)

                            .padding(6)
                         
                            .background(
                                Rectangle()
                                .fill(pinkColor)
                                .cornerRadius(10)
                                .shadow(radius: 1)

                             )
                            
                        Image("dog")
                            .resizable()
                            .frame(width: 110, height: 110)
                            .border(.black)
                            .cornerRadius(10)
                            .padding(6)
                            
                            .background(
                                Rectangle()
                                .fill(pinkColor)
                                .cornerRadius(10)
                                .shadow(radius: 1)

                             )
                            
                            
                        Image("movie")
                             .resizable()
                             .frame(width: 110, height: 110)
                             .border(.black)
                             .cornerRadius(10)

                             .padding(6)
                          
                             .background(
                                 Rectangle()
                                 .fill(pinkColor)
                                 .cornerRadius(10)
                                 .shadow(radius: 1)

                              )
                            
                    }
                    
                    
                    HStack{
                        Image("journal")
                            .resizable()
                            .frame(width: 110, height: 110)
                            .border(.black)
                            .cornerRadius(10)

                            .padding(6)
                         
                            .background(
                                Rectangle()
                                .fill(pinkColor)
                                .cornerRadius(10)
                                .shadow(radius: 1)

                             )
                        Image("candle")
                            .resizable()
                            .frame(width: 110, height: 110)
                            .border(.black)
                            .cornerRadius(10)

                            .padding(6)
                         
                            .background(
                                Rectangle()
                                .fill(pinkColor)
                                .cornerRadius(10)
                                .shadow(radius: 1)

                             )
                        Image("music") .resizable()
                            .resizable()
                            .frame(width: 110, height: 110)
                            .border(.black)
                            .cornerRadius(10)

                            .padding(6)
                         
                            .background(
                                Rectangle()
                                .fill(pinkColor)
                                .cornerRadius(10)
                                .shadow(radius: 1)

                             )
                        
                    }
                }
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                
            }
            }
            
        }
    }


struct secondView: View {
    @State private var searchText = ""
        @State private var searchedFriends: [Friend] = []
        
        var body: some View {
            VStack {
                // Search bar with button
                HStack {
                    TextField("Search for friends...", text: $searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: {
                        searchFriend()
                    }) {
                        HStack(spacing: 5) {
                            Image(systemName: "magnifyingglass")
                            Text("Search")
                        }
                        .padding(8)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                    .disabled(searchText.trimmingCharacters(in: .whitespaces).isEmpty)
                }
                .padding()
                
                // List of searched friends
                List {
                    ForEach($searchedFriends) { $friend in
                        FriendRow(friend: $friend)
                    }
                }
            }
        }
        
        func searchFriend() {
            let trimmedName = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
            guard !trimmedName.isEmpty else { return }
            
            // Avoid duplicates
            if !searchedFriends.contains(where: { $0.name.lowercased() == trimmedName.lowercased() }) {
                searchedFriends.append(Friend(name: trimmedName))
            }
            
            searchText = ""
        }
    }

    // Model for a friend
    struct Friend: Identifiable, Equatable {
        let id = UUID()
        let name: String
        var isAdded = false
    }

    // Row view with profile icon and toggle button (immutable once checked)
    struct FriendRow: View {
        @Binding var friend: Friend
        
        var body: some View {
            HStack {
                Image("profile4")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                Text("   @" + friend.name)
                    .font(.title3)
                
                Spacer()
                
                Button(action: {
                    if !friend.isAdded {
                        friend.isAdded = true
                    }
                }) {
                    Image(systemName: friend.isAdded ? "checkmark" : "plus")
                        .foregroundColor(.white)
                        .frame(width: 30, height: 30)
                        .background(friend.isAdded ? Color.green : Color.blue)
                        .clipShape(Circle())
                }
                .disabled(friend.isAdded) // Disable button once added
            }
            .padding(.vertical, 5)
        }    }


struct thirdView: View{
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
     var body: some View{
         PhotosPicker(
             selection: $selectedItem,
             matching: .images,
             photoLibrary: .shared()) {
                 Text("Select a photo")
             }
             .onChange(of: selectedItem) { newItem in
                 Task {
                     // Retrieve selected asset in the form of Data
                     if let data = try? await newItem?.loadTransferable(type: Data.self) {
                         selectedImageData = data
                     }
                 }
             }

         if let selectedImageData,
            let uiImage = UIImage(data: selectedImageData) {
             Image(uiImage: uiImage)
                 .resizable()
                 .scaledToFit()
                 .frame(width: 250, height: 250)
         }
    }
}



#Preview {
    Profile()
}
