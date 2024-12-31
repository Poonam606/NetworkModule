//
//  RemoteFeedloaderTest.swift
//  NetworkModuleTests
//
//  Created by poonam on 31/12/24.
//

import Foundation
import XCTest
class RemoteFeedloader {
    let url: URL
    let client: HTTPClient
    init(url: URL,client: HTTPClient) {
        self.url = url
        self.client = client
    }
    func load(){
        client.get(from: url)
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
        let url = URL(string: "https://a-url.com")!
        _ = RemoteFeedloader(url: url, client: client)
        
        XCTAssertNil(client.requestedUrl)
    }
    func test_Load_requestDataFromUrl(){
        let client = HttpClientSub()
        let url = URL(string: "https://a-given-url.com")!
        let sut = RemoteFeedloader(url: url, client: client)
        sut.load()
        XCTAssertEqual(client.requestedUrl,url)
    }
}
