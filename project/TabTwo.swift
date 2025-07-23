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
    @State private var selection: String? = nil

    let posts: [Post] = [
        Post(username: "simran.goel",
             caption: "I did the daily task of kindness today, and cooked for a friend! I made a dessert, raspberry crumble. She was feeling down, and it cheered her up. It made me happy to know that I helped :)",
             imageName: "photoOne",
             profileImageName: "profile1"),
        Post(username: "lina.almaeeni",
             caption: "For the daily kindness task I made my brother pasta and some fruit!! Cooking distracted me from some stress that I've been feeling this week.",
             imageName: "photo4",
             profileImageName: "profile2"),
        Post(username: "leela.shah",
             caption: "I completed the daily task by making my family a salad. My parents were so happy they didn't have to cook after work!",
             imageName: "photo3",
             profileImageName: "profile3"),
        Post(username: "ela.agar",
             caption: "Today's daily task was soo fun! I made bruschetta, and it was a great way to spend some tme with them and make them smile.",
             imageName: "photo2",
             profileImageName: "profile4")
    ]

    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 30) {
                        ForEach(posts) { post in
                            PostView(post: post)
                        }
                    }
                    .padding(.top, 150)
                }

                VStack(alignment: .trailing, spacing: 10) {
                    HStack {
                        Text("Social")
                            .font(.system(size: 26, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                            .background(purpleColor)
                            .cornerRadius(25)
                            .shadow(radius: 5)
                            .padding(.horizontal)

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
                        .padding(.trailing)
                    }

                    if isExpanded {
                        Button("Add Post") {
                            selection = "CreatePost"
                            isExpanded = false
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .background(purpleColor)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .shadow(radius: 4)
                        .padding(.trailing, 20)
                        .transition(.opacity)
                    }
                }
                .padding(.top, 40)

                NavigationLink(destination: CreatePost(), tag: "CreatePost", selection: $selection) {
                    EmptyView()
                }
                .hidden()
            }
            .background(Color.white)
        }
    }
}

#Preview {
    ContentView()
}
