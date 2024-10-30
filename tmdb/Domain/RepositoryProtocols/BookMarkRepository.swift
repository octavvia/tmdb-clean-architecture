//
//  BookMarkRepository.swift
//  tmdb
//
//  Created by Aulia Octaviani on 30/10/24.
//

// Domain/Repositories/BookmarkRepository.swift

import Foundation

public class BookmarkRepository {
    public static let shared = BookmarkRepository()
    private var bookmarkedMovies = Set<Int>()
    
    private init() {}
    
    public func isBookmarked(movieId: Int) -> Bool {
        return bookmarkedMovies.contains(movieId)
    }
    
    public func addBookmark(movieId: Int) {
        bookmarkedMovies.insert(movieId)
    }
    
    public func removeBookmark(movieId: Int) {
        bookmarkedMovies.remove(movieId)
    }
    
    public func getAllBookmarkedMovies() -> [Int] {
        return Array(bookmarkedMovies)
    }

}
