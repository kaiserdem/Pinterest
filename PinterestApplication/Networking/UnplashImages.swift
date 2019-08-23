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
enum URLS: String, Codable {
  case raw, full, regular, small, thumb
}
