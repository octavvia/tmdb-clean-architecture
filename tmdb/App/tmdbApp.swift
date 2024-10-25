//
//  tmdbApp.swift
//  tmdb
//
//  Created by Aulia Octaviani on 24/10/24.
//

//import SwiftUI

//@main
//struct tmdbApp: App {
//    let persistenceController = PersistenceController.shared
//
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
//        }
//    }
//}

//// TMDBAppApp.swift
//import SwiftUI
//
//@main
//struct TMDBAppApp: App {
//    var body: some Scene {
//        WindowGroup {
//            let tmdbService = TMDBService()
//            let movieRepository = MovieRepositoryImpl(tmdbService: tmdbService)
//            let getPopularMoviesUseCase = GetPopularMoviesUseCase(repository: movieRepository)
//            let viewModel = MovieListViewModel(getPopularMoviesUseCase: getPopularMoviesUseCase)
//            MovieListView(viewModel: viewModel)
//        }
//    }
//}

// TMDBAppApp.swift
// TMDBAppApp.swift

// TMDBAppApp.swift

//import SwiftUI
//
//@main
//struct TMDBAppApp: App {
//    var body: some Scene {
//        WindowGroup {
//            let tmdbService = TMDBService()
//            let movieRepository = MovieRepositoryImpl(tmdbService: tmdbService)
//            let getPopularMoviesUseCase = GetPopularMoviesUseCase(repository: movieRepository)
//            let searchMoviesUseCase = SearchMoviesUseCase(repository: movieRepository)
//            let movieListViewModel = MovieListViewModel(getPopularMoviesUseCase: getPopularMoviesUseCase, searchMoviesUseCase: searchMoviesUseCase)
//            MovieListView(viewModel: movieListViewModel)
//        }
//    }
//}

// tmdbApp.swift

//import SwiftUI
//
//@main
//struct TMDBApp: App {
//    let persistentContainer = CoreDataStack.shared.persistentContainer
//    let tmdbService = TMDBService()
//    let movieRepository: MovieRepository
//    let getPopularMoviesUseCase: GetPopularMoviesUseCase
//    let searchMoviesUseCase: SearchMoviesUseCase
//    
//    init() {
//        movieRepository = MovieRepositoryImpl(service: tmdbService, persistentContainer: persistentContainer)
//        getPopularMoviesUseCase = GetPopularMoviesUseCase(repository: movieRepository)
//        searchMoviesUseCase = SearchMoviesUseCase(repository: movieRepository)
//    }
//    
//    var body: some Scene {
//        WindowGroup {
//            ContentView(
//                getPopularMoviesUseCase: getPopularMoviesUseCase,
//                searchMoviesUseCase: searchMoviesUseCase
//            )
//            .environment(\.managedObjectContext, persistentContainer.viewContext)
//        }
//    }
//}


// tmdbApp.swift

import SwiftUI

@main
struct TMDBApp: App {
    let persistentContainer = CoreDataStack.shared.persistentContainer
    let tmdbService = TMDBService()
    let movieRepository: MovieRepository
    let getPopularMoviesUseCase: GetPopularMoviesUseCase
    let searchMoviesUseCase: SearchMoviesUseCase
    let getMovieDetailUseCase: GetMovieDetailUseCase
    // let getMovieVideosUseCase: GetMovieVideosUseCase // Dihapus karena tidak digunakan
    
    init() {
        // Inisialisasi Repository dengan semua parameter yang diperlukan
        movieRepository = MovieRepositoryImpl(service: tmdbService, persistentContainer: persistentContainer)
        
        // Inisialisasi Use Cases
        getPopularMoviesUseCase = GetPopularMoviesUseCase(repository: movieRepository)
        searchMoviesUseCase = SearchMoviesUseCase(repository: movieRepository)
        getMovieDetailUseCase = GetMovieDetailUseCase(repository: movieRepository)
        // getMovieVideosUseCase = GetMovieVideosUseCase(repository: movieRepository) // Dihapus karena tidak digunakan
    }
    
    var body: some Scene {
        WindowGroup {
            // Pass semua Use Cases ke ContentView
            ContentView(
                getPopularMoviesUseCase: getPopularMoviesUseCase,
                searchMoviesUseCase: searchMoviesUseCase,
                getMovieDetailUseCase: getMovieDetailUseCase
                // getMovieVideosUseCase: getMovieVideosUseCase // Dihapus karena tidak digunakan
            )
            .environment(\.managedObjectContext, persistentContainer.viewContext)
        }
    }
}







