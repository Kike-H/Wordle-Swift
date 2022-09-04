//
//  API.swift
//  Wordle
//
//  Created by Kike Hernandez D. on 03/09/22.
//

import Foundation
import Alamofire


class WordStore {
    
    static let shared = WordStore()
    private let uri = "https://clientes.api.greenborn.com.ar/public-random-word?c=1&l=5"
    
    func fetchRandomWords(complettion: @escaping(Result<RandomWords, Error>) -> ()) {
        AF.request(uri)
            .responseDecodable(of: RandomWords.self) {response in
                guard let words = response.value else {
                    if let error = response.error {
                        complettion(.failure(error))
                    }
                    return
                }
                complettion(.success(words))
            }
    }
    
}
