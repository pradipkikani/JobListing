//
//  Job.swift
//  JobListing
//
//  Created by Pradip on 17/06/26.
//

import Foundation
import SwiftData

struct JobDTO: Codable {

    let id: String
    let title: String
    let company: String
    let location: String
    let salary: String
    let description: String
}

@Model
final class Job {

    @Attribute(.unique)
    var id: String

    var title: String
    var company: String
    var location: String
    var salary: String
    var descriptionText: String

    init(
        id: String,
        title: String,
        company: String,
        location: String,
        salary: String,
        descriptionText: String
    ) {
        self.id = id
        self.title = title
        self.company = company
        self.location = location
        self.salary = salary
        self.descriptionText = descriptionText
    }
}
