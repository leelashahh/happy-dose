//
//  importPhotos.swift
//  project
//
//  Created by DPI Student 145 on 7/14/25.
//

import PhotosUI
import SwiftUI

@available(iOS 16.0, *)
struct importPhotos: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil

    var body: some View {
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
