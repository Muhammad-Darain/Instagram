//
//  InteractionDetailView.swift
//  Instagram
//
//  Created by mac on 08/03/2025.
//

import SwiftUI
import SDWebImageSwiftUI

struct InteractionDetailView: View {
    let title: String
    let users: [User]

    var body: some View {
        NavigationView {
            List(users, id: \.id) { user in
                HStack {
                    Image("\(user.profileImage)\(Int.random(in: 1...10))")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())

                    Text(user.name)
                        .font(.headline)
                }
                .padding(.vertical, 5)
            }
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
