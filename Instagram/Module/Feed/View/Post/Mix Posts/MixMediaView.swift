//
//  MixMediaView.swift
//  Instagram
//
//  Created by mac on 08/03/2025.
//

import SwiftUI
import SDWebImageSwiftUI

struct MixMediaView: View {
    let mediaModel: [MediaModel]
    @State private var currentPage = 0

    var body: some View {
        VStack(alignment: .center) {
            if mediaModel.count > 1 {
                TabView(selection: $currentPage) {
                    ForEach(mediaModel.indices, id: \.self) { index in
                        if mediaModel[index].mediaType == .image {
                            WebImage.cachedImage(from: mediaModel[index].url)
                        }else {
                            VideoPlayerView(videoURL: mediaModel[index].url)
                        }
                    }
                }
                .frame(height: 500)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                HStack(spacing: 6) {
                    ForEach(mediaModel.indices, id: \.self) { index in
                        Circle()
                            .fill(index == currentPage ? Color.blue : Color.gray.opacity(0.5))
                            .frame(width: 8, height: 8)
                    }
                }
                .padding(.top, 8)
            }
            else if let imageURL = mediaModel.first {
                
                if imageURL.mediaType == .image {
                    WebImage.cachedImage(from: imageURL.url)
                }else {
                    VideoPlayerView(videoURL: imageURL.url)
                }
                
            }
        }
    }
}
