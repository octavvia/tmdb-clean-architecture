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

// Data/Entities/MovieEntity+Extension.swift

// Data/Entities/MovieEntity+Extension.swift

//import Foundation
//import CoreData
//
//extension MovieEntity {
//    // Konversi ke Movie
//    func toDomain() -> Movie {
//        return Movie(
//            id: Int(self.id),
//            title: self.title ?? "",
//            overview: self.overview ?? "",
//            posterPath: self.posterPath
//        )
//    }
//    
//    // Konversi ke MovieDetail
//    func toMovieDetail() -> MovieDetail {
//        // Mengonversi GenreEntity ke Genre
//        let genresSet = self.genres as? Set<GenreEntity> ?? []
//        let genres = genresSet.map { $0.toDomain() }
//        
//        return MovieDetail(
//            id: Int(self.id),
//            title: self.title ?? "",
//            overview: self.overview ?? "",
//            posterPath: self.posterPath,
//            releaseDate: self.releaseDate ?? "",
//            runtime: self.runtime > 0 ? Int(self.runtime) : nil,
//            genres: genres,
//            voteAverage: self.voteAverage
//        )
//    }
//    
//    // Memperbarui MovieEntity dari Movie
//    func update(from movie: Movie) {
//        self.id = Int64(movie.id)
//        self.title = movie.title
//        self.overview = movie.overview
//        self.posterPath = movie.posterPath
//        // Update properti lain sesuai kebutuhan jika ada
//    }
//}
//
//
//// Data/Entities/GenreEntity+Extension.swift
//
//
//extension GenreEntity {
//    func toDomain() -> Genre {
//        return Genre(
//            id: Int(self.id),
//            name: self.name ?? ""
//        )
//    }
//    
//    func update(from genre: Genre) {
//        self.id = Int64(genre.id)
//        self.name = genre.name
//    }
//}





