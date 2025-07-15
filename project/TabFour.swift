import SwiftUI

struct TabFour: View {
    @State private var selectedColor: Color = .white
    @State private var selectedAction: String = "Tap a category above to get a task!"
    @State private var myTasks: [String] = []

    let taskLists: [String: [String]] = [
        "Act of Kindness Task": [
            "Write a thank-you note", "Hold the door for someone", "Compliment a friend",
            "Donate clothes you don’t wear", "Help a sibling with homework", "Pay for someone’s coffee",
            "Leave a kind note for a stranger", "Smile at five people today", "Let someone go ahead of you in line",
            "Pick up litter in your area", "Send a positive text to a friend", "Bring snacks to share at work or school",
            "Leave a positive review for a local business", "Offer to help carry groceries", "Support a local charity",
            "Encourage someone who's struggling", "Give a genuine compliment to a coworker", "Write a thank-you message to a teacher or mentor",
            "Leave coins at a vending machine", "Help a neighbor with yard work"
        ],
        "Self Care Task": [
            "Take a deep breath for 1 minute", "Journal your thoughts", "Light a candle and relax",
            "Take a short nap", "Drink a glass of water", "Unplug from devices for 30 minutes", "Meditate for 5 minutes",
            "Read a chapter of a book", "Take a warm bath or shower", "Listen to your favorite music", "Say 3 things you're grateful for",
            "Spend time in nature", "Do a quick digital declutter", "Treat yourself to something small", "Watch a feel-good movie or show",
            "Write down your goals", "Declutter a small space", "Do something creative", "Set boundaries and say no if needed", "Wear your favorite comfy clothes"
        ],
        "Physical Health Task": [
            "Do 10 jumping jacks", "Take a walk around your block", "Stretch for 5 minutes", "Do 10 squats",
            "Dance to your favorite song", "Drink 8 oz of water", "Try a 1-minute plank", "Take the stairs instead of the elevator",
            "Do 15 sit-ups or crunches", "Try a yoga pose", "Walk in place for 5 minutes", "Do arm circles for 1 minute",
            "Practice good posture for 1 hour", "Do a wall sit for 30 seconds", "Try a short workout video", "Walk barefoot on grass or sand",
            "Balance on one foot for 30 seconds", "Do calf raises for 1 minute", "Go for a bike ride or jog", "Eat a healthy snack like fruit or nuts"
        ]
    ]

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
                            withAnimation(.easeInOut(duration: 0.5)) {
                                selectedColor = pinkColor
                                selectRandomTask(from: "Act of Kindness Task")
                            }
                        }

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
                            withAnimation(.easeInOut(duration: 0.5)) {
                                selectedColor = blueColor
                                selectRandomTask(from: "Self Care Task")
                            }
                        }

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
                            withAnimation(.easeInOut(duration: 0.5)) {
                                selectedColor = greenColor
                                selectRandomTask(from: "Physical Health Task")
                            }
                        }
                }

                RoundedRectangle(cornerRadius: 20)
                    .fill(selectedColor)
                    .frame(width: 300, height: 200)
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

    func selectRandomTask(from category: String) {
        if let tasks = taskLists[category], !tasks.isEmpty {
            selectedAction = tasks.randomElement() ?? "No tasks found"
        } else {
            selectedAction = "No tasks available"
        }
    }

    let pinkColor = Color(red: 255/255, green: 230/255, blue: 250/255)
    let blueColor = Color(red: 210/255, green: 240/255, blue: 255/255)
    let greenColor = Color(red: 215/255, green: 253/255, blue: 218/255)
    let purpleColor = Color(red: 160/255, green: 130/255, blue: 200/255)
}

#Preview {
    TabFour()
}
