//
//  ImageCarouselView.swift
//  Instagram
//
//  Created by mac on 08/03/2025.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageCarouselView: View {
    let imageURLs: [MediaModel]
    @State private var currentPage = 0

    var body: some View {
        VStack(alignment: .center) {
            if imageURLs.count > 1 {
                TabView(selection: $currentPage) {
                    ForEach(imageURLs.indices, id: \.self) { index in
                        WebImage.cachedImage(from: imageURLs[index].url)
                    }
                }
                .frame(height: 500)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                HStack(spacing: 6) {
                    ForEach(imageURLs.indices, id: \.self) { index in
                        Circle()
                            .fill(index == currentPage ? Color.blue : Color.gray.opacity(0.5))
                            .frame(width: 8, height: 8)
                    }
                }
                .padding(.top, 8)
            }
            else if let imageURL = imageURLs.first {
                WebImage.cachedImage(from: imageURL.url)
            }
            
        }
    }
}

