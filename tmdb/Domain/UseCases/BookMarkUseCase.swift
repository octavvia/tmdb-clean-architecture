//
//  BookMarkUseCase.swift
//  tmdb
//
//  Created by Aulia Octaviani on 30/10/24.
//

// Domain/UseCases/BookmarkMovieUseCase.swift

import Foundation

// Domain/UseCases/BookmarkMovieUseCase.swift

public class BookmarkMovieUseCase {
    private let bookmarkRepository: BookmarkRepository
    
    public init(bookmarkRepository: BookmarkRepository = .shared) {
        self.bookmarkRepository = bookmarkRepository
    }
    
    public func execute(movie: MovieDetail) {
        if bookmarkRepository.isBookmarked(movieId: movie.id) {
            bookmarkRepository.removeBookmark(movieId: movie.id)
        } else {
            bookmarkRepository.addBookmark(movieId: movie.id)
        }
    }
    
    // Tambahkan metode publik ini untuk mengecek status bookmark
    public func isBookmarked(movieId: Int) -> Bool {
        return bookmarkRepository.isBookmarked(movieId: movieId)
    }
}
