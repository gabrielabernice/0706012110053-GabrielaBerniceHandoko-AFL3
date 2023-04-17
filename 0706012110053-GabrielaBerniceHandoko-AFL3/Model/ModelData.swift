//
//  ModelData.swift
//  0706012110053-GabrielaBerniceHandoko-AFL3
//
//  Created by MacBook Pro on 11/04/23.
//

import Foundation
import Combine

// to load the data of landmark and hike
final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
    
    // include an instance of user profile that persists even after user dismisses the profile view
    @Published var profile = Profile.default
    
    // to show only featured landmarks to be shown
    var features: [Landmark]{
        landmarks.filter{$0.isFeatured}
    }
    
    // add categories in the form of dictionary, category names as key
    var categories: [String: [Landmark]]{
        Dictionary(
            grouping: landmarks,
            by: {$0.category.rawValue}
        )
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
