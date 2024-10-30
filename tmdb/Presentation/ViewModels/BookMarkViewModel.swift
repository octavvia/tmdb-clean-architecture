import SwiftUI
import CoreData

class BookmarkListViewModel: ObservableObject {
    @Published var bookmarkedMovies: [Movie] = []
    
    private let bookmarkRepository: BookmarkRepository
    private let movieRepository: MovieRepository
    
    init(bookmarkRepository: BookmarkRepository = BookmarkRepository.shared, movieRepository: MovieRepository) {
        self.bookmarkRepository = bookmarkRepository
        self.movieRepository = movieRepository
    }
    
    func loadBookmarkedMovies() {
        let bookmarkedIds = bookmarkRepository.getAllBookmarkedMovies()
        bookmarkedMovies = [] // Kosongkan daftar terlebih dahulu untuk menghindari duplikasi
        
        for id in bookmarkedIds {
            movieRepository.getMovieDetail(movieId: id) { [weak self] result in
                switch result {
                case .success(let movieDetail):
                    DispatchQueue.main.async {
                        let movie = Movie(id: movieDetail.id, title: movieDetail.title, overview: movieDetail.overview, posterPath: movieDetail.posterPath)
                        self?.bookmarkedMovies.append(movie)
                    }
                case .failure(let error):
                    print("Failed to fetch movie details: \(error)")
                }
            }
        }
    }
}
