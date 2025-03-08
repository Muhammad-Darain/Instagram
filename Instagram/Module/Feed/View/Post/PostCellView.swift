//
//  PostCellView.swift
//  Instagram
//
//  Created by mac on 08/03/2025.
//

import SwiftUI
import SDWebImageSwiftUI

struct PostCellView: View {
    let post: PostModel
    @StateObject private var interactionViewModel: PostInteractionViewModel
    @State private var selectedInteractionType: InteractionType?
    
    enum InteractionType: Identifiable {
        case likes, shares, comments
        var id: Self { self }
    }

    init(post: PostModel) {
        self.post = post
        _interactionViewModel = StateObject(wrappedValue: PostInteractionViewModel(post: post))
    }

    var body: some View {
        VStack(alignment: .leading) {
            
            UserInfoView(userImage: post.userProfileImage, username: post.userName)
            
            if post.postType == .image {
                ImageCarouselView(imageURLs: post.postMedia)
            } else if post.postType == .video, let videoURL = post.postMedia.first {
                VideoPlayerView(videoURL: videoURL.url)
            } else if post.postType == .mix{
                MixMediaView(mediaModel: post.postMedia)
            }

            PostInteractionView(interactionViewModel: interactionViewModel, selectedInteractionType: $selectedInteractionType)
        }
        .sheet(item: $selectedInteractionType) { type in
            switch type {
            case .likes:
                InteractionDetailView(title: "Liked by", users: interactionViewModel.likedBy)
                    .presentationDetents([.medium, .large])
            case .shares:
                InteractionDetailView(title: "Shared by", users: interactionViewModel.sharedBy)
                    .presentationDetents([.medium, .large])
            case .comments:
                CommentDetailView(comments: interactionViewModel.comments)
                    .presentationDetents([.medium, .large])
            }
        }
        Spacer()
    }
}
