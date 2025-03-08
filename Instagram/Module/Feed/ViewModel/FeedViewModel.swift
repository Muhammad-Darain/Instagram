//
//  FeedViewModel.swift
//  Instagram
//
//  Created by mac on 08/03/2025.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var posts: [PostModel] = []

    init() {
        loadMockPosts()
    }

    func refreshData() {
        loadMockPosts()
    }
    
    private func loadMockPosts() {
        posts = (1...20).map { _ in
            let randomUser = users.randomElement()!
            let randomLikes = users.shuffled().prefix(Int.random(in: 0...14))
            let randomShares = users.shuffled().prefix(Int.random(in: 0...14))
            let randomComments = (0...Int.random(in: 1...7)).map { _ in
                Comment(user: users.randomElement()!, message: randomCommentMessage())
            }

            let mediaType = PostType.allCases.randomElement()!
            var mediaItems: [MediaModel] = []

            switch mediaType {
            case .image:
                let imageCount = Int.random(in: 1...4)
                mediaItems = Array(postImageURLs.shuffled().prefix(imageCount)).map {
                    MediaModel(mediaType: .image, url: $0)
                }

            case .video:
                mediaItems = [MediaModel(mediaType: .video, url: postVideoURLs.randomElement()!)]

            case .mix:
                let imageCount = Int.random(in: 1...4)
                let videoCount = 1
                let selectedImages = Array(postImageURLs.shuffled().prefix(imageCount))
                let selectedVideos = Array(postVideoURLs.shuffled().prefix(videoCount))
                mediaItems = (selectedImages.map { MediaModel(mediaType: .image, url: $0) }) +
                             (selectedVideos.map { MediaModel(mediaType: .video, url: $0) })
            }

            return PostModel(
                userName: randomUser.name,
                userProfileImage: "\(randomUser.profileImage)\(Int.random(in: 1...10))",
                postType: mediaType,
                postMedia: mediaItems,
                likedBy: Array(randomLikes),
                sharedBy: Array(randomShares),
                comments: randomComments
            )
        }
    }



    private func randomCommentMessage() -> String {
        let comments = [
            "Awesome post!",
            "Loved it! 😍",
            "Great editing!",
            "Wow! This is amazing.",
            "So cool!",
            "Incredible content!",
            "Keep it up!"
        ]
        return comments.randomElement()!
    }
}
