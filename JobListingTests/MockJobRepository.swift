//
//  MockJobRepository.swift
//  JobListing
//
//  Created by Pradip on 17/06/26.
//


@testable import JobListing

final class MockJobRepository: JobRepositoryProtocol {

    var jobs: [Job] = []
    var shouldThrowError = false

    func fetchJobs() async throws -> [Job] {

        if shouldThrowError {
            throw MockError.generic
        }

        return jobs
    }
}

enum MockError: Error {
    case generic
}
