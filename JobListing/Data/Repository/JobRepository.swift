//
//  JobRepository.swift
//  JobListing
//
//  Created by Pradip on 17/06/26.
//

import Foundation
import SwiftData

protocol JobRepositoryProtocol {
    func fetchJobs() async throws -> [Job]
}

final class JobRepository: JobRepositoryProtocol {

    private let service: LocalJSONServiceProtocol
    private let context: ModelContext

    init(
        service: LocalJSONServiceProtocol,
        context: ModelContext
    ) {
        self.service = service
        self.context = context
    }

    func fetchJobs() async throws -> [Job] {

        let cachedJobs = try context.fetch(
            FetchDescriptor<Job>()
        )

        if !cachedJobs.isEmpty {
            return cachedJobs
        }

        let jobsDTO = try await service.fetchJobs()

        let jobs = jobsDTO.map {
            Job(
                id: $0.id,
                title: $0.title,
                company: $0.company,
                location: $0.location,
                salary: $0.salary,
                descriptionText: $0.description
            )
        }

        jobs.forEach {
            context.insert($0)
        }

        try context.save()

        return jobs
    }
}
