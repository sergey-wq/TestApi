//
//  Heroes.swift
//  AppInfo
//
//  Created by Sergey Runovich on 9.04.22.
//

import Foundation

// MARK: - Heroes
struct Heroes: Decodable {
    let results: [Results]
}

// MARK: - Results
struct Results: Decodable {
    let id: Int
    let name: String
    let image: String
    let gender: String
    let location: Location
}

// MARK: - Location
struct Location: Decodable {
    let name: String
}
