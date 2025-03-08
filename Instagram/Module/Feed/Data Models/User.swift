//
//  User.swift
//  Instagram
//
//  Created by mac on 08/03/2025.
//

import Foundation

struct User {
    let id = UUID()
    let name: String
    let profileImage: String
}

let users: [User] = [
    User(name: "Alice", profileImage: "user_"),
    User(name: "Bob", profileImage: "user_"),
    User(name: "Charlie", profileImage: "user_"),
    User(name: "David", profileImage: "user_"),
    User(name: "Emma", profileImage: "user_"),
    User(name: "Frank", profileImage: "user_"),
    User(name: "Grace", profileImage: "user_"),
    User(name: "Henry", profileImage: "user_"),
    User(name: "Ivy", profileImage: "user_"),
    User(name: "Jack", profileImage: "user_"),
    User(name: "Kelly", profileImage: "user_"),
    User(name: "Liam", profileImage: "user_"),
    User(name: "Mia", profileImage: "user_"),
    User(name: "Noah", profileImage: "user_"),
    User(name: "Olivia", profileImage: "user_")
]

let postImageURLs: [String] = [
    "https://i.imgur.com/0TtLOJm.jpeg",
    "https://i.imgur.com/c31CGo7.jpeg",
    "https://i.imgur.com/fVOndmP.jpeg",
    "https://i.imgur.com/a4yeqj3.jpeg",
    "https://i.imgur.com/uTwAfPs.jpeg",
    "https://i.imgur.com/DFgk7Mv.jpeg",
    "https://i.imgur.com/AMVZwHJ.jpeg",
    "https://i.imgur.com/HEUQxvA.jpeg",
    "https://i.imgur.com/mMT1pvf.jpeg",
    "https://i.imgur.com/03fyMLN.jpeg",
    "https://i.imgur.com/jW2J4bb.jpeg",
    "https://i.imgur.com/WHLuPTp.jpeg",
    "https://i.imgur.com/yzp8uNX.jpeg",
    "https://i.imgur.com/0qOoXMR.jpeg",
    "https://i.imgur.com/rIIHezF.jpeg"
]

let postVideoURLs: [String] = [
    "https://i.imgur.com/mN5MS4I.mp4",
    "https://i.imgur.com/TZO54Qr.mp4",
    "https://i.imgur.com/7FF7wju.mp4",
    "https://i.imgur.com/WdSaP9H.mp4",
    "https://i.imgur.com/qliZV8X.mp4",
    "https://i.imgur.com/A7tZkDG.mp4",
    "https://i.imgur.com/eJsvaKc.mp4"
]
