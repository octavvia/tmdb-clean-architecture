//
//  TMDBService.swift
//  tmdb
//
//  Created by Aulia Octaviani on 24/10/24.
//

// Data/API/TMDBService.swift

import Foundation

public struct TMDBService {
    private let apiKey = "6d0f6680c900ce71d6f46bec0199d7b9" // Ganti dengan API Key Anda
    private let baseURL = "https://api.themoviedb.org/3"

    public init() {}

    public func fetchPopularMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        let urlString = "\(baseURL)/movie/popular?api_key=\(apiKey)&language=en-US&page=1"
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }

            do {
                let response = try JSONDecoder().decode(MovieResponse.self, from: data)
                completion(.success(response.results))
            } catch {
                completion(.failure(NetworkError.decodingError))
            }
        }.resume()
    }

    public func searchMovies(query: String, completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        let urlString = "\(baseURL)/search/movie?api_key=\(apiKey)&language=en-US&query=\(encodedQuery)&page=1&include_adult=false"
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }

            do {
                let response = try JSONDecoder().decode(MovieResponse.self, from: data)
                completion(.success(response.results))
            } catch {
                completion(.failure(NetworkError.decodingError))
            }
        }.resume()
    }

    public func fetchMovieDetail(movieId: Int, completion: @escaping (Result<MovieDetail, Error>) -> Void) {
        let urlString = "\(baseURL)/movie/\(movieId)?api_key=\(apiKey)&language=en-US"
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }

            do {
                let movieDetail = try JSONDecoder().decode(MovieDetail.self, from: data)
                completion(.success(movieDetail))
            } catch {
                completion(.failure(NetworkError.decodingError))
            }
        }.resume()
    }

    public func fetchMovieVideos(movieId: Int, completion: @escaping (Result<[Video], Error>) -> Void) {
        let urlString = "\(baseURL)/movie/\(movieId)/videos?api_key=\(apiKey)&language=en-US"
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }

            do {
                let videoResponse = try JSONDecoder().decode(VideoResponse.self, from: data)
                completion(.success(videoResponse.results))
            } catch {
                completion(.failure(NetworkError.decodingError))
            }
        }.resume()
    }
}
