//
//  FeedLoader.swift
//  NetworkModule
//
//  Created by poonam on 31/12/24.
//

import Foundation
enum loadFeedResult {
    case success([FeedItem])
    case error(Error)
}
protocol FeedLoader {
    func loadFeed(completion: @escaping(loadFeedResult)-> Void)
}
