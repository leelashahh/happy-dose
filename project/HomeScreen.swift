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
    
    var body: some View {
        
        let myPink = Color(red: 249.0/255.0, green: 221.0/255.0, blue: 249.0/255.0)
        let myBlue = Color(red: 197/255, green: 234/255, blue: 251/255)
        //let myGreen = Color(red: 0.716, green: 0.899, blue: 0.732)
        
        ScrollView {
            DatePicker("Pick date", selection: .constant(Date()), displayedComponents: .date)
                .frame(width: 350, height: 350)
                .fixedSize()
                .datePickerStyle(.graphical)
                .accentColor(myBlue)
                .border(myBlue, width: 5)
                .background(Color(red: 197/255, green: 234/255, blue: 251/255, opacity: 0.15))
                .padding()
                
                Text("Today's Featured Act of Kindness:")
                    .font(.title2)
                    .padding()
                
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 350, height: 75)
                    .foregroundStyle(myPink)
                    .overlay (alignment: .leading){
                        
                        Button(action: {
                            isCheckedAoK.toggle()
                            trigger += 1
                            isLockedAoK = true
                        }) {
                            Image(systemName: isCheckedAoK ? "checkmark.square.fill" : "square")
                                .foregroundColor(isCheckedAoK ? .green : .gray)
                                .font(.largeTitle)
                            Text("Daily Act Of Kindness 1")
                                .foregroundStyle(.black)
                                .font(.title2)
                        }
                        .disabled(isLockedAoK)
                        .confettiCannon(trigger: $trigger)
                        .padding()
                    }
                    .padding(.bottom)
            
                Text("Personal Tasks:")
                    .font(.title2)
                    .padding()
                
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 350, height: 75)
                    .foregroundStyle(myBlue)
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
                    .foregroundStyle(myBlue)
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
            }
            
        }
    }
//}

#Preview {
    HomeScreen()
}

