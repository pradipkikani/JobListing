//
//  JobListingTests.swift
//  JobListingTests
//
//  Created by Pradip on 17/06/26.
//

import Testing
@testable import JobListing

struct JobListingTests {

    @Test
    @MainActor
    func loadJobsSuccess() async throws {

        let repository = MockJobRepository()

        repository.jobs = [
            Job(
                id: "1",
                title: "iOS Developer",
                company: "Google",
                location: "Remote",
                salary: "20L",
                descriptionText: "Test"
            )
        ]

        let viewModel = JobListViewModel(
            repository: repository
        )

        await viewModel.loadJobs()

        #expect(viewModel.jobs.count == 1)
        #expect(viewModel.state == .loaded)

    }
    
    @Test
    @MainActor
    func loadJobsEmptyState() async throws {

        let repository = MockJobRepository()

        repository.jobs = []

        let viewModel = JobListViewModel(
            repository: repository
        )

        await viewModel.loadJobs()

        #expect(viewModel.jobs.isEmpty)
        #expect(viewModel.state == .empty)
    }
    
    @Test
    @MainActor
    func loadJobsFailure() async throws {

        let repository = MockJobRepository()
        repository.shouldThrowError = true

        let viewModel = JobListViewModel(
            repository: repository
        )

        await viewModel.loadJobs()

        if case .error = viewModel.state {
            #expect(true)
        } else {
            Issue.record("Expected error state")
        }
    }
    
    @Test
    @MainActor
    func searchByTitle() {

        let repository = MockJobRepository()

        let viewModel = JobListViewModel(
            repository: repository
        )

        viewModel.jobs = [
            Job(
                id: "1",
                title: "Senior iOS Developer",
                company: "Google",
                location: "Remote",
                salary: "20L",
                descriptionText: ""
            ),
            Job(
                id: "2",
                title: "Android Developer",
                company: "Amazon",
                location: "Remote",
                salary: "20L",
                descriptionText: ""
            )
        ]

        viewModel.searchText = "iOS"

        #expect(viewModel.filteredJobs.count == 1)
    }
    
    @Test
    @MainActor
    func caseInsensitiveSearch() {

        let repository = MockJobRepository()

        let viewModel = JobListViewModel(
            repository: repository
        )

        viewModel.jobs = [
            Job(
                id: "1",
                title: "Senior IOS Developer",
                company: "Google",
                location: "Remote",
                salary: "20L",
                descriptionText: ""
            )
        ]

        viewModel.searchText = "ios"

        #expect(viewModel.filteredJobs.count == 1)
    }
}
