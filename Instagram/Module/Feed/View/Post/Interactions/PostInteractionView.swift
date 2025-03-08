//
//  PostInteractionView.swift
//  Instagram
//
//  Created by mac on 08/03/2025.
//

import SwiftUI

struct PostInteractionView: View {
    @ObservedObject var interactionViewModel: PostInteractionViewModel
    @Binding var selectedInteractionType: PostCellView.InteractionType?

    var body: some View {
        HStack {
            Button(action: {
                interactionViewModel.toggleLike()
            }) {
                HStack {
                    Image(systemName: interactionViewModel.isLiked ? "heart.fill" : "heart")
                        .foregroundColor(interactionViewModel.isLiked ? .red : .black)
                    Text("\(interactionViewModel.likedBy.count)")
                        .foregroundColor(.black)
                        .onTapGesture { selectedInteractionType = .likes }
                }
            }

            Button(action: {
                interactionViewModel.sharePost()
            }) {
                HStack {
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(.black)
                    Text("\(interactionViewModel.sharedBy.count)")
                        .foregroundColor(.black)
                        .onTapGesture { selectedInteractionType = .shares }
                }
            }

            Button(action: {
                
            }) {
                HStack {
                    Image(systemName: "bubble.right")
                        .foregroundColor(.black)
                    Text("\(interactionViewModel.comments.count)")
                        .foregroundColor(.black)
                        .onTapGesture { selectedInteractionType = .comments }
                }
            }

            Spacer()
        }
        .padding(.horizontal, 10)
    }
}
