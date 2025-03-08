//
//  PostType.swift
//  Instagram
//
//  Created by mac on 08/03/2025.
//

import Foundation

enum PostType:CaseIterable {
    case image
    case video
    case mix
}

struct PostModel: Identifiable {
    let id = UUID()
    let userName: String
    let userProfileImage: String
    let postType: PostType
    let postMedia: [MediaModel]
    var likedBy: [User]
    var sharedBy: [User]
    var comments: [Comment]
}

struct MediaModel: Identifiable {
    let id = UUID()
    let mediaType: PostType
    let url: String
}
