//
//  GetMovieDetailUserCase.swift
//  tmdb
//
//  Created by Aulia Octaviani on 24/10/24.
//

// Domain/UseCases/GetMovieDetailUseCase.swift
// Kelas ini bertanggung jawab untuk mengelola logika bisnis yang diperlukan untuk mendapatkan detail dari sebuah movie

import Foundation

public class GetMovieDetailUseCase {
    // digunakan untuk mengakses data yang dibutuhkan
    private let repository: MovieRepository

    init(repository: MovieRepository) {
        self.repository = repository
    }
    
    // Fungsi execute adalah metode utama yang menjalankan logika bisnis dari use case ini, yaitu mengambil detail film berdasarkan ID film yang diberikan
    // @escaping Sebuah closure yang akan dipanggil ketika permintaan detail film selesai. Closure ini mengembalikan
    func execute(movieId: Int, completion: @escaping (Result<MovieDetail, Error>) -> Void) {
        repository.getMovieDetail(movieId: movieId, completion: completion)
    }
}

// Domain/UseCases/GetMovieDetailUseCase.swift

//import Foundation
//
//public class GetMovieDetailUseCase {
//    private let repository: MovieRepository
//
//    public init(repository: MovieRepository) {
//        self.repository = repository
//    }
//
//    public func execute(movieId: Int, completion: @escaping (Result<Movie, Error>) -> Void) {
//        repository.getMovieDetail(movieId: movieId, completion: completion)
//    }
//}
