//
//  APIClientProtocol.swift
//  JobListing
//
//  Created by Pradip on 17/06/26.
//
import Foundation

enum APIError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
    case networkError
}

protocol APIClientProtocol {
    func fetch<T: Decodable>(
        from url: URL
    ) async throws -> T
}

final class APIClient: APIClientProtocol {

    func fetch<T: Decodable>(
        from url: URL
    ) async throws -> T {

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
              200...299 ~= httpResponse.statusCode else {
            throw APIError.invalidResponse
        }

        return try JSONDecoder().decode(T.self, from: data)
    }
}
