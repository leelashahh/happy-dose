//
//  TabThree.swift
//  project
//
//  Created by Ela Agar on 7/14/25.
//

import SwiftUI

struct TabThree: View {
    var body: some View {
        VStack{
            Text("Progress")
                .font(.system(size: 26, weight: .semibold, design: .rounded))
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                .background(pinkColor)
                .cornerRadius(25)
                .shadow(radius: 5)
                .padding(.horizontal)
            Spacer()
            
        }
    }
}

#Preview {
    TabThree()
}
