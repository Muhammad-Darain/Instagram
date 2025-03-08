//
//  InteractionListView.swift
//  Instagram
//
//  Created by mac on 08/03/2025.
//

import SwiftUI
import SDWebImageSwiftUI

struct InteractionListView: View {
    let title: String
    let users: [User]

    var body: some View {
        HStack {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(users, id: \.id) { user in
                        Image("\(user.profileImage)\(Int.random(in: 1...10))")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 30, height: 30)
                            .clipShape(Circle())
                    }
                }
            }
        }
    }
}
