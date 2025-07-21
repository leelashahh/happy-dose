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
    
    var body: some View {
        Text("Create Post View")
        
        
        
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
                } else {
                    Image("seflie")
                        .resizable()
                        .frame(width: 200, height: 140)
                        .clipShape(Circle())
                }

            }
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
