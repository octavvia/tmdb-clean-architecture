//
//  MovieResponse.swift
//  tmdb
//
//  Created by Aulia Octaviani on 24/10/24.
//

// Data/API/MovieResponse.swift

import Foundation

public struct MovieResponse: Codable {
    public let results: [Movie]
    
    public init(results: [Movie]) {
        self.results = results
    }
}
