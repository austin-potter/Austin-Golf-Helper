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
    @State private var newClubDistance: String = ""
    @State private var selectedClub = ""
    
    let clubOptions = ["","Driver","3 Wood", "5 Wood", "7 Wood", "2 Hybrid","3 Hybrid","4 Hybrid","5 Hybrid","6 Hybrid","1 Iron","2 Iron","3 Iron","4 Iron","5 Iron","6 Iron","7 Iron","8 Iron","9 Iron","PW","AW","SW","LW","48° W", "50° W","52° W","54° W", "56° W","58° W", "60° W", "62° W"]

    init() {
        print("ContentView initialized")
    }
    
    private var isButtonDisabled: Bool {
        selectedClub.isEmpty || newClubDistance.isEmpty
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // List of clubs
                List {
                    ForEach(golfBag.clubs) { club in
                        HStack {
                            Text(club.name)
                            Text("Distance: \(club.distance, specifier: "%.1f") yards")
                        }
                    }
                    .onDelete(perform: deleteClub)
                }
                
                // New club input
                VStack{
                    
                    HStack {
                        //                    TextField("Club Name", text: $newClubName)
                        //                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        //                        .padding()
                        
                        Picker("Club", selection: $selectedClub) {
                            ForEach(clubOptions, id: \.self) { club in
                                Text(club == "" ? "Select Club" : club)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        .padding()
                        
                        
                        TextField("Dist. (Yds)", text: $newClubDistance)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                            .keyboardType(.numberPad) // Set keyboard type to number pad
                    }
                        
                        Button(action: addClub) {
                            Text("Add Club")
                                .font(.headline)
                                .frame(maxWidth: .infinity )
                                .frame(maxHeight: 80)
                                .background(isButtonDisabled ? Color.gray : Color.blue)
                                .foregroundColor(isButtonDisabled ? Color.white.opacity(0.5) : Color.white)
                                .cornerRadius(8)
                                .padding()
                        }
                        .disabled(isButtonDisabled)
                    
                }
                .navigationTitle("Golf Bag")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Golf Bag")
                            .font(.largeTitle)
                            .foregroundColor(.primary)
                            .fontWeight(.bold)
                    }
                }
            }
        }
    }
    // Function to add a new club to the bag
    private func addClub() {
        guard !newClubName.isEmpty else { return }
        
        // Convert distance to Double and check for a valid value
        if let distanceValue = Double(newClubDistance) {
            golfBag.addClub(name: newClubName, distance: distanceValue) // Add the new club
            print("Added club: \(newClubName), Distance: \(newClubDistance)") // Print added club details
        } else {
            print("Invalid distance value: \(newClubDistance)") // Print error message for invalid distance
        }
        
        newClubName = "" // Clear the text field
        newClubDistance = "" // Clear the distance text field
        selectedClub = "" // Clear selected club

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

