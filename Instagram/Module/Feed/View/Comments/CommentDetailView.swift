//
//  CommentDetailView.swift
//  Instagram
//
//  Created by mac on 08/03/2025.
//

import SwiftUI

struct CommentDetailView: View {
    let comments: [Comment]

    var body: some View {
        NavigationView {
            List(comments, id: \.message) { comment in
                HStack {
                    Image("\(comment.user.profileImage)\(Int.random(in: 1...10))")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())

                    VStack(alignment: .leading) {
                        Text(comment.user.name)
                            .font(.headline)
                        Text(comment.message)
                    }
                }
                .padding(.vertical, 5)
            }
            .navigationTitle("Comments")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
