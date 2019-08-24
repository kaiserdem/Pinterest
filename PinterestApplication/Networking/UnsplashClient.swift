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
  static let apiKey = "091343ce13c8ae780065ecb3b13dc903475dd22cb78a05503c2e0c69c5e98044"
  
  func fetch(with endpoint: UnspashEndpoint, completion:@escaping (Either<Photos>) -> Void) {
    let request = endpoint.request
    get(with: request, completion: completion)
  }
}
