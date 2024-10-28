//
//  LandingView.swift
//  Austin's Golf Helper
//
//  Created by Austin Potter on 10/27/24.
//

import SwiftUI

struct LandingView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Welcome to Golf Helper")
                    .font(.largeTitle)
                    .padding()
                
                // Navigation button to the Golf Bag page
                NavigationLink(destination: ContentView()) {
                    Text("Go to Golf Bag")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                // Add more navigation buttons as needed
//                NavigationLink(destination: ContentView()) {
//                    Text("Go to Other Page")
//                        .font(.headline)
//                        .frame(maxWidth: .infinity)
//                        .padding()
//                        .background(Color.green)
//                        .foregroundColor(.white)
//                        .cornerRadius(8)
//                }
            }
            .padding()
        }
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
