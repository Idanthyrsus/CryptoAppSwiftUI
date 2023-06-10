//
//  NetworkingManager.swift
//  CryptoCurrencySwiftUI
//
//  Created by Alexander Korchak on 20.05.2023.
//

import Foundation
import Combine

protocol NetworkingManagerProtocol {
    static func download(url: URL) -> AnyPublisher<Data, Error>
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data
    static func handleCompletion(completion: Subscribers.Completion<Error>)
}

final class NetworkingManager {
    
    enum NetworkingError: LocalizedError {
        case badURLResponse(url: URL)
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .badURLResponse(url: let url):
                return "Bad response from URL: \(url)"
            case .unknown:
                return "Unknown error occured"
            }
        }
    }
    
    static func download(url: URL) -> AnyPublisher<Data, Error> {
        
       return URLSession.shared.dataTaskPublisher(for: url)
             .tryMap({ try handleURLResponse(output: $0, url: url) })
             .retry(3)
             .eraseToAnyPublisher()
    }
    
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkingError.badURLResponse(url: url)
        }
        return output.data
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .failure(let error):
            print(error.localizedDescription)
        case .finished:
            break
        }
    }
}
