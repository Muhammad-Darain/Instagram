//
//  FeedView.swift
//  Instagram
//
//  Created by mac on 08/03/2025.
//

import SwiftUI

struct FeedView: View {
    @StateObject private var viewModel = FeedViewModel()

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                ForEach(viewModel.posts) { post in
                    PostCellView(post: post)
                }
            }
        }
        .refreshable {
            await refreshFeed()
        }
    }

    private func refreshFeed() async {
        try? await Task.sleep(for: .seconds(1))
        viewModel.refreshData()
    }
}

