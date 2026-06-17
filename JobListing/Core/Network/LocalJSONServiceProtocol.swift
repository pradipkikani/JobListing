//
//  LocalJSONServiceProtocol.swift
//  JobListing
//
//  Created by Pradip on 17/06/26.
//


import Foundation

protocol LocalJSONServiceProtocol {
    func fetchJobs() async throws -> [JobDTO]
}

final class LocalJSONService: LocalJSONServiceProtocol {

    func fetchJobs() async throws -> [JobDTO] {

        guard let url = Bundle.main.url(
            forResource: "jobs",
            withExtension: "json"
        ) else {
            throw URLError(.fileDoesNotExist)
        }

        let data = try Data(contentsOf: url)

        return try JSONDecoder().decode(
            [JobDTO].self,
            from: data
        )
    }
}
