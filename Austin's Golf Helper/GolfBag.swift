//
//  GolfClub.swift
//  Austin's Golf Helper
//
//  Created by Austin Potter on 10/23/24.
//

import Foundation

// A model to represent a golf club
struct GolfClub: Identifiable {
    let id = UUID() // Unique identifier for each club
    var name: String // Name of the club (e.g., Driver, 7 Iron)
    var distance: Double // Array of distances (yardages) the user manually enters
    
}

// A model to represent a user's golf bag
struct GolfBag {
    var clubs: [GolfClub] = []
    
    // Add a club to the bag
    mutating func addClub(name: String, distance: Double) {
        let newClub = GolfClub(name: name, distance: distance)
        clubs.append(newClub)
    }
    
    // Remove a club from the bag by its id
    mutating func removeClub(id: UUID) {
        clubs.removeAll { $0.id == id }
    }
}

