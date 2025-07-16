//
//  TabTwo.swift
//  project
//
//  Created by Ela Agar on 7/14/25.
//

import SwiftUI

struct Post: Identifiable {
    let id = UUID()
    let username: String
    let caption: String
    let imageName: String
    let profileImageName: String
}

struct PostView: View {
    let post: Post
    @State private var isLiked = false

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
        
            HStack {
                Image(post.profileImageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .background(Circle().fill(Color.gray.opacity(0.3)))
                Text("@\(post.username)")
                    .fontWeight(.bold)
                Spacer()
            }

            
            Image(post.imageName)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(8)

           
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("@\(post.username)")
                        .fontWeight(.bold)

                    Text(post.caption)
                        .fixedSize(horizontal: false, vertical: true)
                }

                Spacer()

                Image(systemName: isLiked ? "heart.fill" : "heart")
                            .font(.system(size: 20))
                            .foregroundColor(isLiked ? .red : .primary)
                            .padding(.top, 2)
                            .onTapGesture {
                                isLiked.toggle()
                            }
            }
        }
        .padding()
    }
}


struct TabTwo: View {
    @State private var isExpanded = false

    let posts: [Post] = [
        Post(username: "simran.goel",
             caption: "I did the daily task of kindness today, and cooked for a friend! I made a dessert, raspberry crumble :)",
             imageName: "photoOne",
             profileImageName: "profile1"),
        Post(username: "lina.almaeeni",
             caption: "For the daily kindness task I made my brother pasta and some fruit!!n",
             imageName: "photo2",
             profileImageName: "profile2"),
        Post(username: "leela.shah",
             caption: "I completed the daily task today! I made my family a salad. My parents were so happy they didn't have to cook after work!",
             imageName: "photo3",
             profileImageName: "profile3"),
        Post(username: "ela.agar",
             caption: "Today's daily task was sooo fun! I made bruschetta",
             imageName: "photo4",
             profileImageName: "profile4")
    ]

    var body: some View {
        ZStack(alignment: .topTrailing) {
            ScrollView {
                VStack(alignment: .leading, spacing: 30) {
                    ForEach(posts) { post in
                        PostView(post: post)
                    }
                }
                .padding(.top, 100)
            }

            VStack(alignment: .trailing) {
                if isExpanded {
                    Button("Add Post") {
                        print("Add Post Tapped")
                        withAnimation {
                            isExpanded = false
                        }
                    }
                    .padding()
                    .background(purpleColor)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .transition(.opacity)
                }

                Button(action: {
                    withAnimation {
                        isExpanded.toggle()
                    }
                }) {
                    ZStack {
                        Circle()
                            .fill(purpleColor)
                            .frame(width: 50, height: 50)
                        Image(systemName: "plus")
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                    }
                }
                .buttonStyle(.plain)
            }
            .padding(.top, 20)
            .padding(.trailing, 20)
        }
        .background(Color.white)
    }
}

let pinkColor = Color(red: 255/255, green: 230/255, blue: 250/255)
let blueColor = Color(red: 210/255, green: 240/255, blue: 255/255)
let greenColor = Color(red: 215/255, green: 253/255, blue: 218/255)
let purpleColor = Color(red: 160/255, green: 130/255, blue: 200/255)

#Preview {
    ContentView()
}
