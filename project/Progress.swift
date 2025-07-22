//
//  TabThree.swift
//  project
//
//  Created by Ela Agar on 7/14/25.
//

import SwiftUI

struct Progress: View {
    let numberOfCircles = 10
    let circleSize: CGFloat = 100
    let spacing: CGFloat = 25
    
    @State private var completedLevels: Set<Int> = []
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: spacing) {
                ForEach(0..<numberOfCircles, id: \.self) { index in
                    VStack(spacing: 8) {
                        Text("Level \(index + 1)")
                            .font(.headline)
                            .foregroundColor(.primary)
                        
                        Circle()
                            .fill(completedLevels.contains(index) ?  Color.green : Color.blue.opacity(0.5))
                            .frame(width: circleSize, height: circleSize)
                            .onTapGesture {
                                if completedLevels.contains(index) {
                                    completedLevels.remove(index)
                                }  else {
                                    
                                    completedLevels.insert(index)
                                }
                            }
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
        }
        .background(
            Image("cutehouse")// add image to assets first then change the name
                .resizable()
                .scaledToFill( )
                .ignoresSafeArea()
    )
}
}
#Preview {
    Progress()
}
