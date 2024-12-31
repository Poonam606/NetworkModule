//
//  RemoteFeedloaderTest.swift
//  NetworkModuleTests
//
//  Created by poonam on 31/12/24.
//

import Foundation
import XCTest
class RemoteFeedloader {
    let client: HTTPClient
    init(client: HTTPClient) {
        self.client = client
    }
    func load(){
        client.get(from: URL(string: "https://a-url.com")!)
    }

}
protocol HTTPClient {
   
    func get(from url: URL)
    
}
class HttpClientSub : HTTPClient {
     func get(from url: URL) {
        requestedUrl = url
    }
     var requestedUrl: URL?
}
class RemoteFeedloaderTest : XCTestCase {
    
    func test_init_doesnotrequestedFromUrl(){
        let client = HttpClientSub()
   
        _ = RemoteFeedloader(client: client)
        
        XCTAssertNil(client.requestedUrl)
    }
    func test_Load_requestDataFromUrl(){
        let client = HttpClientSub()
        
        let sut = RemoteFeedloader(client: client)
        sut.load()
        XCTAssertNotNil(client.requestedUrl)
    }
}
