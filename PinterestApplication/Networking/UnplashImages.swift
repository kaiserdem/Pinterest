//
//  UnplashImages.swift
//  PinterestApplication
//
//  Created by Kaiserdem on 23.08.2019.
//  Copyright © 2019 Kaiserdem. All rights reserved.
//

import Foundation

typealias Photos = [Photo]

struct Photo: Codable {
  let id: String
  let urls: URLS
}

struct URLS: Codable {
  let raw: URL
  let full: URL
  let regular: URL
  let small: URL
  let thumb: URL
}
