//
//  CacheManager.swift
//  Instagram
//
//  Created by mac on 08/03/2025.
//

import Foundation

class CacheManager {
    static let shared = CacheManager()
    private var videoCache: [String: URL] = [:]

    func getCachedURL(for key: String) -> URL? {
        return videoCache[key]
    }

    func cacheVideo(url: URL, key: String) {
        videoCache[key] = url
    }
}
