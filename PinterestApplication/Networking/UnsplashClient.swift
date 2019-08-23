//
//  UnsplashClient.swift
//  PinterestApplication
//
//  Created by Kaiserdem on 23.08.2019.
//  Copyright © 2019 Kaiserdem. All rights reserved.
//

import Foundation

class UnsplashClient: APIClient {
  static let baseUrl = "http://api.unsplash.com"
  static let apiKey = "da097c2e80660d648a125576880617a6418021c604cc84264ecfaa151169e91b"
  
  func fetch(with endpoint: UnspashEndpoint, completion:@escaping (Either<[Photos]>) -> Void) {
    let request = endpoint.request
    get(with: request, completion: completion)
  }
}
