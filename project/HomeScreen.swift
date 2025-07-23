//
//  HomeScreen.swift
//  project
//
//  Created by Ela Agar on 7/14/25.
//

import SwiftUI
import ConfettiSwiftUI

struct HomeScreen: View {
    
    @State private var trigger: Int = 0
    @State private var isCheckedAoK = false
    @State private var isLockedAoK: Bool = false
    @State private var isCheckedTask1 = false
    @State private var isLockedTask1: Bool = false
    @State private var isCheckedTask2 = false
    @State private var isLockedTask2: Bool = false
    @State private var showAlert = false
    @State private var selection: String? = nil
    let blue2 = Color(red: 0/255, green: 174/255, blue: 255/255)
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                Text("Kind Dose")
                    .font(.system(size: 26, weight: .semibold, design: .rounded))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .background(blueColor)
                    .cornerRadius(25)
                    .shadow(radius: 5)
                    .padding(.horizontal)
                
                ZStack {
                    DatePicker("Pick date", selection: .constant(Date()), displayedComponents: .date)
                        .frame(width: 350, height: 350)
                        .fixedSize()
                        .datePickerStyle(.graphical)
                        .accentColor(blueColor)
                        .background(Color(red: 197/255, green: 234/255, blue: 251/255, opacity: 0.15))
                        .padding()
                    
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(blueColor, lineWidth: 6)
                        .frame(width: 363, height: 358)
                        .shadow(radius: 3)
                    
                    Circle()//2
                        .stroke(blue2, lineWidth: 5)
                        .frame(width: 41, height: 41)
                        .offset(x:0, y: -61)
                    Circle()//3
                        .stroke(blue2, lineWidth: 5)
                        .frame(width: 41, height: 41)
                        .offset(x:50, y: -61)
                    Circle()//4
                        .stroke(blue2, lineWidth: 5)
                        .frame(width: 41, height: 41)
                        .offset(x:100, y: -61)
                    Circle()//5
                        .stroke(blue2, lineWidth: 5)
                        .frame(width: 41, height: 41)
                        .offset(x:150, y: -61)
                    Circle()//7
                        .stroke(blue2, lineWidth: 5)
                        .frame(width: 41, height: 41)
                        .offset(x:-100, y: -12)
                    Circle()//9
                        .stroke(blue2, lineWidth: 5)
                        .frame(width: 41, height: 41)
                        .offset(x:0, y: -12)
                    Circle()//10
                        .stroke(blue2, lineWidth: 5)
                        .frame(width: 41, height: 41)
                        .offset(x:50, y: -12)
                    Circle()//12
                        .stroke(blue2, lineWidth: 5)
                        .frame(width: 41, height: 41)
                        .offset(x:150, y: -12)
                    Circle()//13
                        .stroke(blue2, lineWidth: 5)
                        .frame(width: 41, height: 41)
                        .offset(x:-150, y: 38)
                    Circle()//14
                        .stroke(blue2, lineWidth: 5)
                        .frame(width: 41, height: 41)
                        .offset(x:-100, y: 38)
                    Circle()//15
                        .stroke(blue2, lineWidth: 5)
                        .frame(width: 41, height: 41)
                        .offset(x:-49, y: 38)
                    Circle()//16
                        .stroke(blue2, lineWidth: 5)
                        .frame(width: 41, height: 41)
                        .offset(x:0, y: 38)
                    Circle()//19
                        .stroke(blue2, lineWidth: 5)
                        .frame(width: 41, height: 41)
                        .offset(x:150, y: 38)
                    Circle()//20
                        .stroke(blue2, lineWidth: 5)
                        .frame(width: 41, height: 41)
                        .offset(x:-150, y: 87)
                    Circle()//21
                        .stroke(blue2, lineWidth: 5)
                        .frame(width: 41, height: 41)
                        .offset(x:-100, y: 87)
                    if (isCheckedAoK)
                    {
                        Circle()//23
                            .stroke(blue2, lineWidth: 5)
                            .frame(width: 41, height: 41)
                            .offset(x: 0, y: 87)
                    }
                    
                }
                
                Text("Today's Featured Act of Kindness:")
                    .font(.title2)
                    .padding()
                
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 350, height: 75)
                    .foregroundStyle(pinkColor)
                    .shadow(radius: 5)
                    .overlay (alignment: .leading){
                        
                        Button(action: {
                                isCheckedAoK.toggle()
                                trigger += 1
                                isLockedAoK = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                showAlert = true
                            }}) {
                            Image(systemName: isCheckedAoK ? "checkmark.square.fill" : "square")
                                .foregroundColor(isCheckedAoK ? .green : .gray)
                                .font(.largeTitle)
                            Text(taskLists["Act of Kindness Task"]?.first ?? "No task found")
                                .foregroundStyle(.black)
                                .font(.title3)
                            NavigationLink(destination: CreatePost(), tag: "CreatePost", selection: $selection) {
                                EmptyView()
                            }
                        }
                        .disabled(isLockedAoK)
                        .alert("Great Job!", isPresented: $showAlert){
                            Button("Post Now") {
                                selection = "CreatePost"
                            }
                            .keyboardShortcut(.defaultAction)
                            Button("Post Later") {
                                showAlert = false
                            }
                        } message: {
                            Text("Do you want to post a reflection for today's act of kindness?")
                        }
                        .confettiCannon(trigger: $trigger)
                        .padding()
                    }
                    .padding(.bottom)
                
                Text("Personal Tasks:")
                    .font(.title2)
                    .padding()
                
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 350, height: 75)
                    .foregroundStyle(blueColor)
                    .shadow(radius: 5)
                    .overlay (alignment: .leading){
                        Button(action: {
                            isCheckedTask1.toggle()
                            isLockedTask1 = true
                        }){
                            
                            Image(systemName: isCheckedTask1 ? "checkmark.square.fill" : "square")
                                .foregroundColor(isCheckedTask1 ? .green : .gray)
                                .font(.largeTitle)
                            Text("Donate clothes you don't wear")
                                .foregroundStyle(.black)
                                .font(.title3)
                        }
                        .disabled(isLockedTask1)
                        .padding()
                    }
                
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 350, height: 75)
                    .foregroundStyle(blueColor)
                    .shadow(radius: 5)
                    .overlay (alignment: .leading){
                        Button(action: {
                            isCheckedTask2.toggle()
                            isLockedTask2 = true
                            
                        }){
                            
                            Image(systemName: isCheckedTask2 ? "checkmark.square.fill" : "square")
                                .foregroundColor(isCheckedTask2 ? .green : .gray)
                                .font(.largeTitle)
                            Text("Listen to your favorite music")
                                .foregroundStyle(.black)
                                .font(.title3)
                        }
                        .disabled(isLockedTask2)
                        .padding()
                        
                    }
                
                HStack {
                    Image(systemName: "star.circle.fill")
                        .font(.headline)
                        .foregroundColor(.black)
                    Text("Add to My Tasks")
                        .font(.headline)
                        .foregroundColor(.black)
                }
                .padding()
                .frame(width: 220, height: 50)
                .background(blueColor)
                .cornerRadius(25)
                .shadow(radius: 5)
                .padding()
            }
        }
    }
}


#Preview {
    HomeScreen()
}

