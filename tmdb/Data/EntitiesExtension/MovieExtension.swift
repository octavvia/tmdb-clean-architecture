//
//  MovieExtension.swift
//  tmdb
//
//  Created by Aulia Octaviani on 25/10/24.
//

// Data/Entities/MovieEntity+Extension.swift

// Data/Entities/MovieEntity+Extension.swift

//import Foundation
//import CoreData
//
extension MovieEntity {
    func toDomain() -> Movie {
        return Movie(
            id: Int(self.id),
            title: self.title ?? "",
            overview: self.overview ?? "",
            posterPath: self.posterPath
        )
    }
    
    func update(from movie: Movie) {
        self.id = Int64(movie.id)
        self.title = movie.title
        self.overview = movie.overview
        self.posterPath = movie.posterPath
        // Update properti lain sesuai kebutuhan jika ada
    }
}
