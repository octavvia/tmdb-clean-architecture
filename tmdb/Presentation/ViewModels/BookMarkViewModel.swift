//
//  BookMarkViewModel.swift
//  tmdb
//
//  Created by Aulia Octaviani on 30/10/24.
//

// Presentation/ViewModels/BookmarkListViewModel.swift

//import Foundation
//import Combine
//
//class BookmarkListViewModel: ObservableObject {
//    @Published var bookmarkedMovies: [Movie] = []
//    private let bookmarkRepository: BookmarkRepository
//    let getMovieDetailUseCase: GetMovieDetailUseCase
//    
//    init(bookmarkRepository: BookmarkRepository = .shared, getMovieDetailUseCase: GetMovieDetailUseCase) {
//        self.bookmarkRepository = bookmarkRepository
//        self.getMovieDetailUseCase = getMovieDetailUseCase
//        loadBookmarkedMovies()
//    }
//    
//    private func loadBookmarkedMovies() {
//        self.bookmarkedMovies = bookmarkRepository.getAllBookmarkedMovies()
//    }
//}


//// Presentation/ViewModels/BookmarkListViewModel.swift
//
//import Foundation
//import Combine
//
//class BookmarkListViewModel: ObservableObject {
//    @Published var bookmarkedMovies: [Movie] = []
//    private let bookmarkRepository: BookmarkRepository
//    let getMovieDetailUseCase: GetMovieDetailUseCase
//    
//    init(bookmarkRepository: BookmarkRepository = .shared, getMovieDetailUseCase: GetMovieDetailUseCase) {
//        self.bookmarkRepository = bookmarkRepository
//        self.getMovieDetailUseCase = getMovieDetailUseCase
//        Task {
//            await loadBookmarkedMovies()
//        }
//    }
//    
//    private func loadBookmarkedMovies() async {
//        self.bookmarkedMovies = await bookmarkRepository.getAllBookmarkedMovies(using: getMovieDetailUseCase)
//    }
//}

// Presentation/ViewModels/BookmarkListViewModel.swift

//import Foundation
//import Combine
//
//class BookmarkListViewModel: ObservableObject {
//    @Published var bookmarkedMovies: [Movie] = []
//    private let bookmarkRepository: BookmarkRepository
//    let getMovieDetailUseCase: GetMovieDetailUseCase
//    
//    init(bookmarkRepository: BookmarkRepository = .shared, getMovieDetailUseCase: GetMovieDetailUseCase) {
//        self.bookmarkRepository = bookmarkRepository
//        self.getMovieDetailUseCase = getMovieDetailUseCase
//        loadBookmarkedMovies()
//    }
//    
//    private func loadBookmarkedMovies() {
//        bookmarkRepository.getAllBookmarkedMovies(using: getMovieDetailUseCase) { [weak self] movies in
//            DispatchQueue.main.async {
//                self?.bookmarkedMovies = movies
//            }
//        }
//    }
//}
