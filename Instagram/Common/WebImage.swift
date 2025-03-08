//
//  WebImage.swift
//  Instagram
//
//  Created by mac on 08/03/2025.
//

import SwiftUI
import SDWebImageSwiftUI

extension WebImage where Content == Image {
    
    static func cachedImage(from urlString: String?) -> some View {
        WebImage(url: URL(string: urlString ?? ""))
            .resizable()
            .indicator(.activity)
            .transition(.fade(duration: 0.5))
            .frame(height: 500)
            .scaledToFit()
    }
}
