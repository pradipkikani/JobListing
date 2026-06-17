//
//  JobDetailViewModel.swift
//  JobListing
//
//  Created by Pradip on 17/06/26.
//

import Combine

final class JobDetailViewModel: ObservableObject {

    let job: Job

    init(job: Job) {
        self.job = job
    }
}
