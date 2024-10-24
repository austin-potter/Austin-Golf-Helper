//
//  ContentView.swift
//  Austin's Golf Helper
//
//  Created by Austin Potter on 10/23/24.
//

import SwiftUI

struct ContentView: View {
    // Create a GolfBag instance
    @State private var golfBag = GolfBag()
    @State private var newClubName = ""
    @State private var newClubLoft: String = ""

    init() {
        print("ContentView initialized")
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // List of clubs
                List {
                    ForEach(golfBag.clubs) { club in
                        HStack {
                            Text(club.name)
                            if let loft = club.loft {
                                Text("Loft: \(loft, specifier: "%.1f")°")
                            }
                        }
                    }
                    .onDelete(perform: deleteClub)
                }
                
                // New club input
                HStack {
                    TextField("Club Name", text: $newClubName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    TextField("Loft (°)", text: $newClubLoft)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .keyboardType(.decimalPad) // Set keyboard type to decimal pad
                    
                    Button(action: addClub) {
                        Text("Add Club")
                            .padding()
                    }
                    .disabled(newClubName.isEmpty || Double(newClubLoft) == nil)
                }
            }
            .navigationTitle("Golf Helper")
        }
    }

    // Function to add a new club to the bag
    private func addClub() {
        guard !newClubName.isEmpty else { return }
        
        // Convert loft to Double and check for a valid value
        if let loftValue = Double(newClubLoft) {
            golfBag.addClub(name: newClubName, loft: loftValue) // Add the new club
            print("Added club: \(newClubName), Loft: \(newClubLoft)") // Print added club details
        } else {
            print("Invalid loft value: \(newClubLoft)") // Print error message for invalid loft
        }
        
        newClubName = "" // Clear the text field
        newClubLoft = "" // Clear the loft text field

    }

    // Function to delete a club
    private func deleteClub(at offsets: IndexSet) {
        golfBag.clubs.remove(atOffsets: offsets)
    }
}

// Preview provider for the ContentView
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

