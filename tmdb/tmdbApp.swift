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

// TMDBAppApp.swift
import SwiftUI

@main
struct TMDBAppApp: App {
    var body: some Scene {
        WindowGroup {
            let tmdbService = TMDBService()
            let movieRepository = MovieRepositoryImpl(tmdbService: tmdbService)
            let getPopularMoviesUseCase = GetPopularMoviesUseCase(repository: movieRepository)
            let viewModel = MovieListViewModel(getPopularMoviesUseCase: getPopularMoviesUseCase)
            MovieListView(viewModel: viewModel)
        }
    }
}
