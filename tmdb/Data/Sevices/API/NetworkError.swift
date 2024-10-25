//
//  NetworkError.swift
//  tmdb
//
//  Created by Aulia Octaviani on 24/10/24.
//

// Data/API/NetworkError.swift

import Foundation

public enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
    case unknown
}
