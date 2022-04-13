//
//  NetworkManager.swift
//  Networking
//
//  Created by Alexey Efimov on 24.09.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import Foundation
import Alamofire

enum Link: String {
    case rickAndMortyURL = "https://rickandmortyapi.com/api/character"
    case topApplicationURL = "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/25/apps.json"
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchImage(from url: String?, completion: @escaping(Result<Data, NetworkError>) -> Void) {
        guard let url = URL(string: url ?? "") else {
            completion(.failure(.invalidURL))
            return
        }
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else {
                completion(.failure(.noData))
                return
            }
            DispatchQueue.main.async {
                completion(.success(imageData))
            }
        }
    }
    
    func fetch<T: Decodable>(dataType: T.Type, from url: String, completion: @escaping(Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let type = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(type))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }


    func fetchDataWithAlamofire(_ url: String, completion: @escaping(Result<[Info], NetworkError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let hero = Info.getResults(from: value)
                    completion(.success(hero))
                case .failure(let error):
                    print(error)
                    completion(.failure(.decodingError))
                }
            }
    }
}
