//
//  APIClient.swift
//  PinterestApplication
//
//  Created by Kaiserdem on 23.08.2019.
//  Copyright © 2019 Kaiserdem. All rights reserved.
//

import Foundation

enum Either<T> {
  case success(T)
  case error(Error)
}

enum APIError: Error {
  case unknown, badResponse, jsonDecoder, imageDownload, imageConvert
}

protocol APIClient {
  var session: URLSession { get }
  func get<T: Codable>(with request: URLRequest, completion: @escaping (Either<[T]>) -> Void)
}
extension APIClient {
  
  var session: URLSession {
    return URLSession.shared
  }

  func get<T: Codable>(with request: URLRequest, completion: @escaping (Either<[T]>) -> Void) {

    let tack = session.dataTask(with: request) { (data, response, error) in
      guard error == nil else {
        completion(.error(error!))
        return
      }
      guard let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode else {
        completion(.error(APIError.badResponse))
        return
      }
      guard let value = try? JSONDecoder().decode([T].self, from: data!) else {
        completion(.error(APIError.jsonDecoder))
        return
      }
      DispatchQueue.main.async {
         completion(.success(value))
      }
    }
    tack.resume()
  }
}
