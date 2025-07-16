//
//  TabFive.swift
//  project
//
//  Created by Ela Agar on 7/14/25.
//

import SwiftUI
import PhotosUI

struct TabFive: View {
    
   
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    var body: some View {
        
        NavigationStack{
            VStack {
                
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
//                Image("seflie")
//                    .resizable()
//                    .frame(width: 180, height: 120)
//                    .clipShape(Circle())

                  PhotosPicker(
                    selection: $selectedItem,
                    matching: .images,
                    photoLibrary: .shared()
                ) {
                    if let selectedImageData,
                       let uiImage = UIImage(data: selectedImageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .frame(width: 200, height: 140)
                            .clipShape(Circle())
                    } else {
                        Image("seflie")
                            .resizable()
                            .frame(width: 200, height: 140)
                            .clipShape(Circle())
                    }
                }
                .onChange(of: selectedItem) { newItem in
                    Task {
                        if let data = try? await newItem?.loadTransferable(type: Data.self) {
                            selectedImageData = data
                        }
                    }
                }

                Text("@username")
                    . font(.system(size: 30))
                
                
                Spacer()
                Spacer()
                
                HStack(spacing: 150){
                    Text("15")
                        .fontWeight(.heavy)
                        .font(.system(size:30))
                    
                    Text("20")
                        .fontWeight(.heavy)
                        .font(.system(size: 30))
                }
                HStack(spacing: 150){
                    Text("friends")
                    VStack{
                        Text("tasks")
                        Text("completed")

                    }
                }
                Spacer()
                Spacer()
                Spacer()
                
                VStack{
                    Text("Archive").fontWeight(.heavy)
                        .font(.system(size: 30))
                        .padding()
                        .padding()
                     
                     HStack{
                         
                        Image("first")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .border(.black)
                        Image("dog")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .border(.black)
                        Image("movie")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .border(.black)
                    }
                    HStack{
                        Image("journal")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .border(.black)
                        Image("candle")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .border(.black)
                        Image("music") .resizable()
                            .frame(width: 120, height: 120)
                            .border(.black)
                        
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
    @State private var fullText: String = "Search for Friends..."
    @State private var isChecked = false

    var body: some View {
        
        Text("add friends")
        VStack{
            HStack{
                Spacer()
                TextEditor(text: $fullText).shadow(radius: 5)
                Spacer()
                
            }
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            
            HStack{
                
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 60, height: 60)
                Text("@username")
                // make the text whatever the user types in and then searches
                
                Button(action: {
                    withAnimation(.spring()) {
                        isChecked.toggle()
                    }
                }) {
                    Image(systemName: isChecked ? "checkmark" : "plus")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                        .frame(width: 60, height: 60)
                        .background(Circle().fill(isChecked ? Color.green : Color.blue))
                        .shadow(radius: 5)
                }
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
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
   
            Spacer()
   
   
        }
    }


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
    TabFive()
}
