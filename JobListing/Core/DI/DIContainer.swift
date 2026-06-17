//
//  DIContainer.swift
//  JobListing
//
//  Created by Pradip on 17/06/26.
//

import SwiftData

final class DIContainer {

    let repository: JobRepositoryProtocol

    init(
        context: ModelContext
    ) {

        repository = JobRepository(
            service: LocalJSONService(),
            context: context
        )
    }
}
