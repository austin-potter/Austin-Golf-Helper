//
//  GolfClub.swift
//  Austin's Golf Helper
//
//  Created by Austin Potter on 10/23/24.
//

import Foundation

// A model to represent a golf club
struct GolfClub: Identifiable, Codable {
    var id = UUID() // Unique identifier for each club
    var name: String // Name of the club (e.g., Driver, 7 Iron)
    var distance: Double // Array of distances (yardages) the user manually enters
    
}

// A model to represent a user's golf bag
struct GolfBag: Codable {
    var clubs: [GolfClub] = []
    
    // Add a club to the bag
    mutating func addClub(name: String, distance: Double) {
        let newClub = GolfClub(name: name, distance: distance)
        clubs.append(newClub)
        sortClubsByDistance()
    }
    
    // Remove a club from the bag by its id
    mutating func removeClub(id: UUID) {
        clubs.removeAll { $0.id == id }
        sortClubsByDistance()
    }
    
    private mutating func sortClubsByDistance() {
        clubs.sort { $0.distance > $1.distance}
    }
    
    func save() {
        if let encodedData = try? JSONEncoder().encode(self) {
            UserDefaults.standard.set(encodedData, forKey: "golfBagData")
        }
    }
    
    static func load() -> GolfBag {
        if let savedData = UserDefaults.standard.data(forKey: "golfBagData"), let decodedGolfBag = try? JSONDecoder().decode(GolfBag.self, from: savedData) {
            return decodedGolfBag
        } else{
            return GolfBag()
        }
    }
}

