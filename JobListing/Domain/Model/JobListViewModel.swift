//
//  JobListViewModel.swift
//  JobListing
//
//  Created by Pradip on 17/06/26.
//

import Combine
import Foundation

enum ViewState: Equatable {
    case idle
    case loading
    case loaded
    case empty
    case error(String)
}


@MainActor
final class JobListViewModel: ObservableObject {

    @Published var jobs: [Job] = []
    @Published var searchText = ""
    @Published var state: ViewState = .idle

    private let repository: JobRepositoryProtocol

    init(repository: JobRepositoryProtocol) {
        self.repository = repository
    }

    func loadJobs() async {

        state = .loading

        do {

            let jobs = try await repository.fetchJobs()

            self.jobs = jobs

            state = jobs.isEmpty
                ? .empty
                : .loaded

        } catch {

            state = .error(
                error.localizedDescription
            )
        }
    }

    var filteredJobs: [Job] {

        guard !searchText.isEmpty else {
            return jobs
        }

        return jobs.filter {

            $0.title.localizedCaseInsensitiveContains(searchText)
            ||
            $0.company.localizedCaseInsensitiveContains(searchText)
        }
    }
}
