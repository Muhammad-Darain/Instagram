//
//  UserInfoView.swift
//  Instagram
//
//  Created by mac on 08/03/2025.
//

import SwiftUI

struct UserInfoView: View {
    let userImage: String
    let username: String

    var body: some View {
        HStack {
            Image(userImage)
                .resizable()
                .cornerRadius(12.5)
                .frame(width: 25, height: 25)
                .padding(.leading, 10)

            Text(username)
                .font(Font.system(size: 14, weight: .semibold))

            Spacer()

            Image("menu")
                .resizable()
                .frame(width: 25, height: 25)
                .padding(.trailing, 10)
        }
        .frame(height: 25)
    }
}
