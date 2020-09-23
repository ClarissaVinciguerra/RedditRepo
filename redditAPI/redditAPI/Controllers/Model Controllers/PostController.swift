//
//  PostController.swift
//  redditAPI
//
//  Created by Clarissa Vinciguerra on 9/23/20.
//
// https://www.reddit.com/r/funny/.json
import Foundation

struct StringConstants {
    fileprivate static let baseURL = "https://www.reddit.com"
    fileprivate static let rEndpoint = "r"
    fileprivate static let funnyEndpoint = "funny"
    fileprivate static let jsonExtension = "json"
}

class PostController {
    
    
    
    static func fetchPost(completion: @escaping (Result<[Post], PostError>) -> Void) {
        guard let baseURL = URL(string: StringConstants.baseURL) else { return completion(.failure(.invalidURL)) }
        
        let rComponentURL = baseURL.appendingPathComponent(StringConstants.rEndpoint)
        let funnyComponentURL = rComponentURL.appendingPathComponent(StringConstants.funnyEndpoint)
        let finalURL = funnyComponentURL.appendingPathExtension(StringConstants.jsonExtension)
        print(finalURL)
    }
}
