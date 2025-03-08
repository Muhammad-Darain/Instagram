//
//  PostInteractionViewModel.swift
//  Instagram
//
//  Created by mac on 08/03/2025.
//

import Foundation
import SwiftUI

class PostInteractionViewModel: ObservableObject {
    @Published var likedBy: [User]
    @Published var sharedBy: [User]
    @Published var comments: [Comment]
    @Published var isLiked: Bool = false
    @Published var newComment: String = ""

    private let currentUser = users[0]

    init(post: PostModel) {
        self.likedBy = post.likedBy
        self.sharedBy = post.sharedBy
        self.comments = post.comments
        self.isLiked = post.likedBy.contains { $0.id == currentUser.id }
    }

    func toggleLike() {
        if isLiked {
            likedBy.removeAll { $0.id == currentUser.id }
        } else {
            likedBy.append(currentUser)
        }
        isLiked.toggle()
    }

    func sharePost() {
        if !sharedBy.contains(where: { $0.id == currentUser.id }) {
            sharedBy.append(currentUser)
        }
    }

    func addComment() {
        if !newComment.isEmpty {
            let newCommentObj = Comment(user: currentUser, message: newComment)
            comments.append(newCommentObj)
            newComment = ""
        }
    }
}
