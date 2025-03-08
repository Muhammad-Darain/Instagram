# 🎥 CacheManager  
https://github.com/user-attachments/assets/c335be1c-06ac-4905-9cd9-2729d860c253

# Description 
**VideoCacheManager** is a lightweight Swift utility for caching videos locally in an iOS application. It helps efficiently store and retrieve downloaded video files, reducing redundant network requests and improving performance.  

## 🚀 Features  
- ✅ Singleton instance for easy access  
- ✅ Stores cached videos in the app's cache directory  
- ✅ Retrieves cached videos using a unique key  
- ✅ Downloads and caches videos asynchronously  
- ✅ Handles errors gracefully  

## 📌 Usage  

### 🔍 Retrieve Cached Video  
```swift
if let cachedURL = VideoCacheManager.shared.getCachedVideoURL(for: "videoKey") {
    // Use the cached video
}
```

```swift
let videoURL = URL(string: "https://example.com/video.mp4")!
VideoCacheManager.shared.cacheVideo(from: videoURL, key: "videoKey") { cachedURL in
    if let cachedURL = cachedURL {
        print("Video cached at:", cachedURL)
    } else {
        print("Failed to cache video")
    }
}
```

### ⚙️ How It Works
- Uses FileManager to create a VideoCache directory inside the app’s cache folder.
- Checks if a video is already cached before downloading.
- Downloads the video asynchronously using URLSession.downloadTask.
- Moves the downloaded file to the cache directory for persistent storage.
