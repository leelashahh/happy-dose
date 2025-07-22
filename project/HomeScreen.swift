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
    
    var body: some View {

        ScrollView {
            DatePicker("Pick date", selection: .constant(Date()), displayedComponents: .date)
                .frame(width: 350, height: 350)
                .fixedSize()
                .datePickerStyle(.graphical)
                .accentColor(blueColor)
                .border(blueColor, width: 5)
                .background(Color(red: 197/255, green: 234/255, blue: 251/255, opacity: 0.15))
                .padding()
            
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
                
                ZStack{
                    DatePicker("Pick date", selection: .constant(Date()), displayedComponents: .date)
                        .frame(width: 350, height: 350)
                        .fixedSize()
                        .datePickerStyle(.graphical)
                        .accentColor(blueColor)
                        .background(Color(red: 197/255, green: 234/255, blue: 251/255, opacity: 0.15))
                        .padding()
                    
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(blueColor, lineWidth: 5)
                        .shadow(color: .gray, radius: 5, x: 0, y: 0)
                        .frame(width: 370, height: 355)
                    
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
                        }) {
                            Image(systemName: isCheckedAoK ? "checkmark.square.fill" : "square")
                                .foregroundColor(isCheckedAoK ? .green : .gray)
                                .font(.largeTitle)
                            Text(taskLists["Act of Kindness Task"]?.first ?? "No task available")
                                .foregroundStyle(.black)
                                .font(.title2)
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
                            Text("Personal Task 1")
                                .foregroundStyle(.black)
                                .font(.title2)
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
                            Text("Personal Task 2")
                                .foregroundStyle(.black)
                                .font(.title2)
                        }
                        .disabled(isLockedTask2)
                        .padding()
                        
                    }


                HStack {
                    Image(systemName: "star.circle.fill")
                        .font(.headline)
                        .foregroundColor(.black)
                    Text("Add New Task")
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

#Preview {
    HomeScreen()
}

