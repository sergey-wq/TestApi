//
//  TopApp.swift
//  AppInfo
//
//  Created by Sergey Runovich on 9.04.22.
//

import Foundation

//не получилось, попробую еще завтра обязательно

// MARK: - AppResult
struct AppResult: Codable {
    let name: String?
    let artworkUrl100: String?

    init(topApp: [String: Any]) {
        name = topApp["name"] as? String
        artworkUrl100 = topApp["artworkUrl100"] as? String
    }

    static func getResults(from value: Any) -> [AppResult] {
        guard let appTopData = value as? [[String: Any]] else { return [] }
        return appTopData.compactMap { AppResult(topApp: $0) }
    }
}

struct AllResultsInfo: Codable {
    let results: [AppResult]

    static func transformToResult(data: Any) -> [AppResult] {
        guard let data = data as? [String: Any],
        let currenciesData = data["results"] else { return [] }
        let value = AppResult.getResults(from: currenciesData)
        return value
    }
}
