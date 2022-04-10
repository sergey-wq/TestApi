//  DataFetcherService.swift
//  AppInfo
//
//  Created by Sergey Runovich on 9.04.22.
//

import Foundation

class DataFetcherService {
    
    var dataFetcher: DataFetcher
    
    init(dataFetcher: DataFetcher = NetworkDataFetcher()) {
        self.dataFetcher = dataFetcher
    }
    
    func fetchInfoHeroes(completion: @escaping (Heroes?) -> Void) {
        let urlNewGames = "https://rickandmortyapi.com/api/character"
        dataFetcher.fetchGenericJSONData(urlString: urlNewGames, response: completion)
    }

    func fetchTopApplication(completion: @escaping (TopApp?) -> Void) {
        let urlNewGames = "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/25/apps.json"
        dataFetcher.fetchGenericJSONData(urlString: urlNewGames, response: completion)
    }
}
