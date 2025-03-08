//
//  VideoCacheManager.swift
//  Instagram
//
//  Created by mac on 08/03/2025.
//

import Foundation

class VideoCacheManager {
    static let shared = VideoCacheManager()
    private let cacheDirectory: URL

    private init() {
        
        let paths = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
        self.cacheDirectory = paths[0].appendingPathComponent("VideoCache")
        
        if !FileManager.default.fileExists(atPath: cacheDirectory.path) {
            try? FileManager.default.createDirectory(at: cacheDirectory, withIntermediateDirectories: true)
        }
    }

    func getCachedVideoURL(for key: String) -> URL? {
        let fileURL = cacheDirectory.appendingPathComponent(key)
        return FileManager.default.fileExists(atPath: fileURL.path) ? fileURL : nil
    }

    func cacheVideo(from url: URL, key: String, completion: @escaping (URL?) -> Void) {
        let destinationURL = cacheDirectory.appendingPathComponent(key)
        
        if FileManager.default.fileExists(atPath: destinationURL.path) {
            completion(destinationURL)
            return
        }

        let task = URLSession.shared.downloadTask(with: url) { (tempURL, _, error) in
            guard let tempURL = tempURL, error == nil else {
                print("❌ Video Download Error:", error?.localizedDescription ?? "Unknown error")
                completion(nil)
                return
            }

            do {
                try FileManager.default.moveItem(at: tempURL, to: destinationURL)
                completion(destinationURL)
            } catch {
                print("❌ Error saving video:", error.localizedDescription)
                completion(nil)
            }
        }
        task.resume()
    }
}
