import SwiftUI

struct TaskDeck: View {
    @State private var selectedColor: Color = .white
    @State private var selectedAction: String = "Tap a category above to get a task!"
    @State private var myTasks: [String] = []

    @State private var showCard = false
    @State private var cardScale: CGFloat = 0.5
    @State private var cardOpacity: Double = 0.0

    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                Text("Daily Task Deck")
                    .font(.system(size: 26, weight: .semibold, design: .rounded))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .background(purpleColor)
                    .cornerRadius(25)
                    .shadow(radius: 5)
                    .padding(.horizontal)

                HStack(spacing: 15) {
                    // Kindness Card
                    RoundedRectangle(cornerRadius: 15)
                        .fill(pinkColor)
                        .frame(width: 110, height: 180)
                        .shadow(radius: 5)
                        .overlay(
                            VStack {
                                Text("💖")
                                    .font(.system(size: 40))
                                Text("Act of Kindness")
                                    .font(.headline)
                                    .multilineTextAlignment(.center)
                                    .fontDesign(.rounded)
                            }
                            .padding(5)
                        )
                        .onTapGesture {
                            animateCardDraw(for: pinkColor, category: "Act of Kindness Task")
                        }

                    // Self Care Card
                    RoundedRectangle(cornerRadius: 15)
                        .fill(blueColor)
                        .frame(width: 110, height: 180)
                        .shadow(radius: 5)
                        .overlay(
                            VStack {
                                Text("🧘")
                                    .font(.system(size: 40))
                                Text("Self Care")
                                    .font(.headline)
                                    .multilineTextAlignment(.center)
                                    .fontDesign(.rounded)
                            }
                            .padding(5)
                        )
                        .onTapGesture {
                            animateCardDraw(for: blueColor, category: "Self Care Task")
                        }

                    // Physical Health Card
                    RoundedRectangle(cornerRadius: 15)
                        .fill(greenColor)
                        .frame(width: 110, height: 180)
                        .shadow(radius: 5)
                        .overlay(
                            VStack {
                                Text("💪")
                                    .font(.system(size: 40))
                                Text("Physical Health")
                                    .font(.headline)
                                    .multilineTextAlignment(.center)
                                    .fontDesign(.rounded)
                            }
                            .padding(5)
                        )
                        .onTapGesture {
                            animateCardDraw(for: greenColor, category: "Physical Health Task")
                        }
                }

                // Animated Task Card
                RoundedRectangle(cornerRadius: 20)
                    .fill(selectedColor)
                    .frame(width: 300, height: 280)
                    .scaleEffect(cardScale)
                    .opacity(cardOpacity)
                    .overlay(
                        Text(selectedAction)
                            .font(.title2)
                            .fontDesign(.rounded)
                            .padding()
                            .multilineTextAlignment(.center)
                    )
                    .shadow(radius: 5)
                    .padding(.top)

                VStack(spacing: 15) {
                    Button(action: {
                        myTasks.append(selectedAction)
                    }) {
                        HStack {
                            Image(systemName: "star.circle.fill")
                                .font(.headline)
                                .foregroundColor(.white)
                            Text("Add to My Tasks")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .padding()
                        .frame(width: 220, height: 50)
                        .background(purpleColor)
                        .cornerRadius(25)
                        .shadow(radius: 5)
                    }
                }

                Spacer()
            }
            .padding()
        }
    }

    func animateCardDraw(for color: Color, category: String) {
        withAnimation(.easeInOut(duration: 0.3)) {
            selectedColor = color
            showCard = false
            cardScale = 0.5
            cardOpacity = 0.0
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            selectRandomTask(from: category)
            withAnimation(.easeOut(duration: 0.4)) {
                showCard = true
                cardScale = 1.0
                cardOpacity = 1.0
            }
        }
    }

    func selectRandomTask(from category: String) {
        if let tasks = taskLists[category], !tasks.isEmpty {
            selectedAction = tasks.randomElement() ?? "No tasks found"
        } else {
            selectedAction = "No tasks available"
        }
    }
}




#Preview {
    ContentView()
}
