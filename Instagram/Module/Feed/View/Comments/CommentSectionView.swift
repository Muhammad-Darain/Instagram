//
//  CommentSectionView.swift
//  Instagram
//
//  Created by mac on 08/03/2025.
//

import SwiftUI
import SDWebImageSwiftUI

struct CommentSectionView: View {
    @ObservedObject var viewModel: PostInteractionViewModel
    var onCommentTap: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text("Comments")
                    .font(.headline)
                Spacer()
                Text("\(viewModel.comments.count)")
                    .onTapGesture { onCommentTap() } 
            }

            ForEach(viewModel.comments, id: \.message) { comment in
                HStack {
                    WebImage(url: URL(string: comment.user.profileImage))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading) {
                        Text("\(comment.user.name)")
                            .bold()
                        Text(comment.message)
                    }
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            }

            HStack {
                TextField("Add a comment...", text: $viewModel.newComment)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button(action: {
                    viewModel.addComment()
                }) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.blue)
                }
            }
        }
        .padding(.top, 8)
    }
}
