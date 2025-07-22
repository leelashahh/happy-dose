//
//  CreatePost.swift
//  project
//
//  Created by Ela Agar on 7/16/25.
//

import SwiftUI
import PhotosUI

struct CreatePost: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    @State private var reflection: String = ""

    
    var body: some View {
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
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                } else {
                    VStack{
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(blueColor, lineWidth: 8)
                                .frame(width: 250, height: 250)
                                .padding()
            
                            Image("upload")
                                .resizable()
                                .renderingMode(.template)
                                .foregroundStyle(blueColor)
                                .frame(width: 80, height: 80)

                        }
                        Text("Tap to Upload Image")
                            .foregroundStyle(.black)
                            .bold()
                    }
                }
            }
        }
        .padding()
        
        Text("Enter your reflection: ")
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
            .padding(.top)
            .bold()
        TextField("Start typing...", text: $reflection)
            .padding(.leading)
        VStack{
            Spacer()
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 300, height: 55)
                .foregroundStyle(blueColor)
                .overlay (alignment: .center){
                    Text("Post!")
                        .bold()
                }
                .padding(32)
        }
        
        
        .onChange(of: selectedItem) { newItem in
            Task {
                if let data = try? await newItem?.loadTransferable(type: Data.self) {
                    selectedImageData = data
                }
            }
        }
        
        
    }
}

#Preview {
    CreatePost()
}
