//
//  ImageCache.swift
//  tmdb
//
//  Created by Aulia Octaviani on 25/10/24.
//

// Data/Services/ImageCache.swift

import UIKit

class ImageCache {
    static let shared = ImageCache()
    
    private let cacheDirectory: URL
    private let fileManager = FileManager.default
    
    private init() {
        // Mendapatkan direktori cache
        cacheDirectory = fileManager.urls(for: .cachesDirectory, in: .userDomainMask).first!
        
        // Membuat direktori untuk gambar jika belum ada
        let imagesDirectory = cacheDirectory.appendingPathComponent("images")
        if !fileManager.fileExists(atPath: imagesDirectory.path) {
            try? fileManager.createDirectory(at: imagesDirectory, withIntermediateDirectories: true, attributes: nil)
        }
    }
    
    func imageURL(for url: URL) -> URL {
        let filename = url.lastPathComponent
        return cacheDirectory.appendingPathComponent("images").appendingPathComponent(filename)
    }
    
    func getImage(for url: URL) -> UIImage? {
        let localURL = imageURL(for: url)
        return UIImage(contentsOfFile: localURL.path)
    }
    
    func saveImage(_ image: UIImage, for url: URL) {
        let localURL = imageURL(for: url)
        if let data = image.jpegData(compressionQuality: 1.0) {
            try? data.write(to: localURL)
        }
    }
}
