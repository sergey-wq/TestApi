//
//  Heroes.swift
//  AppInfo
//
//  Created by Sergey Runovich on 9.04.22.
//

import Foundation

// MARK: - Info

struct Info: Codable {
    let id: Int?
    let name: String?
    let image: String?
    let gender: String?
    let location: Location?

    init(hero: [String: Any]) {
        id = hero["id"] as? Int
        name = hero["name"] as? String
        image = hero["image"] as? String
        gender = hero["gender"] as? String
        location = hero["location"] as? Location
    }

    static func getResults(from value: Any) -> [Info] {
        guard let heroData = value as? [[String: Any]] else { return [] }
        return heroData.compactMap { Info(hero: $0) }
    }
}

// MARK: - Location
struct Location: Codable {
    let name: String?

    init(hero: [String: Any]) {
        name = hero["name"] as? String
    }
}
