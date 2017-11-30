//
//  APIClient.swift
//  WeatherApp
//
//  Created by Vandan Patel on 11/29/17.
//  Copyright © 2017 Vandan Patel. All rights reserved.
//

import Foundation

enum Either<T, E: Error> {
    case value(T)
    case error(E)
}

enum APIError: Error {
    case apiError
    case badResponse
    case jsonDecoder
    case unknown(String)
}

protocol APIClient {
    var session: URLSession { get }
    func fetch<T: Codable>(with request: URLRequest, completion: @escaping (Either<T, APIError>) -> ())
}

extension APIClient {
    func fetch<T: Codable>(with request: URLRequest, completion: @escaping (Either<T, APIError>) -> ()) {
        let task = session.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                completion(.error(.apiError))
                return
            }
            
            guard let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode else {
                completion(.error(.badResponse))
                return
            }
            
            guard let value = try? JSONDecoder().decode(T.self, from: data!) else {
                completion(.error(.jsonDecoder))
                return
            }
            
            completion(.value(value))
        }
        task.resume()
    }
}
