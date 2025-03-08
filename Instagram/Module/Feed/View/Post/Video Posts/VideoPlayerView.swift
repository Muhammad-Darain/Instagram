//
//  VideoPlayerView.swift
//  Instagram
//
//  Created by mac on 08/03/2025.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    let videoURL: String
    @State private var player: AVPlayer?
    @State private var showReplayButton = false
    @State private var isMuted = true
    @State private var isPlaying = false
    @State private var isDownloading = false

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Video Player
                VideoPlayerContainer(player: player)
                    .onAppear {
                        loadVideo()
                    }
                    .onDisappear {
                        player?.pause()
                        isPlaying = false
                    }
                    .frame(height: 500)
                    .onChange(of: geometry.frame(in: .global).midY) { oldValue, newValue in
                        handleScroll(midY: newValue, screenHeight: UIScreen.main.bounds.height)
                    }
                
                // Mute Button
                VStack (alignment: .trailing) {
                    HStack {
                        Spacer()
                        Button(action: {
                            toggleMute()
                        }) {
                            if !isDownloading {
                                Image(systemName: isMuted ? "speaker.slash.fill" : "speaker.wave.2.fill")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                                    .foregroundColor(.white)
                                    .background(Color.black.opacity(0.6))
                                    .clipShape(Circle())
                                    .padding(10)
                            }
                        }
                    }
                    Spacer()
                }
                
                // Replay Button
                if showReplayButton {
                    Button(action: {
                        replayVideo()
                    }) {
                        Image(systemName: "arrow.clockwise.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                            .background(Color.black.opacity(0.6))
                            .clipShape(Circle())
                    }
                }

                
                if isDownloading {
                    VStack {
                        ProgressView("Loading...")
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            .scaleEffect(1.5)
                            .padding()
                            .background(Color.black.opacity(0.7))
                            .cornerRadius(10)
                            .font(.caption2)
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        }
        .frame(height: 500)
    }

    private func loadVideo() {
        guard let url = URL(string: videoURL) else { return }

        let fileName = url.lastPathComponent
        if let cachedURL = VideoCacheManager.shared.getCachedVideoURL(for: fileName) {
            print("Playing Cached Video: \(cachedURL)")
            setupPlayer(with: cachedURL)
        } else {
            print("Downloading Video: \(url)")
            isDownloading = true
            VideoCacheManager.shared.cacheVideo(from: url, key: fileName) { cachedURL in
                isDownloading = false
                if let cachedURL = cachedURL {
                    DispatchQueue.main.async {
                        self.setupPlayer(with: cachedURL)
                    }
                }
            }
        }
    }

    private func setupPlayer(with url: URL) {
        player = AVPlayer(url: url)
        player?.isMuted = isMuted
        player?.play()
        addVideoCompletionObserver()
    }

    private func addVideoCompletionObserver() {
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player?.currentItem, queue: .main) { _ in
            showReplayButton = true
        }
    }

    private func replayVideo() {
        player?.seek(to: .zero)
        player?.play()
        showReplayButton = false
        isPlaying = true
    }

    private func toggleMute() {
        isMuted.toggle()
        player?.isMuted = isMuted
    }

    private func handleScroll(midY: CGFloat, screenHeight: CGFloat) {
        let screenMiddle = screenHeight / 2
        let activationRange = screenHeight * 0.3

        if abs(midY - screenMiddle) < activationRange {
            if !isPlaying {
                player?.play()
                isPlaying = true
            }
        } else {
            if isPlaying {
                player?.pause()
                isPlaying = false
            }
        }
    }
}

struct VideoPlayerContainer: UIViewControllerRepresentable {
    var player: AVPlayer?

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        return controller
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        uiViewController.player = player
    }
}
