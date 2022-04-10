//
//  TopApp.swift
//  AppInfo
//
//  Created by Sergey Runovich on 9.04.22.
//

import Foundation

// MARK: - TopApp
struct TopApp: Decodable {
    let feed: Feed
}

// MARK: - Feed
struct Feed: Decodable {
    let results: [AppResult]
}

// MARK: - AppResult
struct AppResult: Decodable {
    let name: String
    let artworkUrl100: String
}
