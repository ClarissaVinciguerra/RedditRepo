//
//  PostError.swift
//  redditAPI
//
//  Created by Clarissa Vinciguerra on 9/23/20.
//

import Foundation


enum PostError: LocalizedError {
    
    case invalidURL
    case thrownError(Error)
    case noData
    case thrownImageError(Error)
    case unableToDecodeImage
}
