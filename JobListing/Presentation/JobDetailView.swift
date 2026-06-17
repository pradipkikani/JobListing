//
//  JobDetailView.swift
//  JobListing
//
//  Created by Pradip on 17/06/26.
//

import SwiftUI

struct JobDetailView: View {
    let job: Job
    var body: some View {
        ScrollView {
            VStack( alignment: .leading,  spacing: 24) {

                Text(job.title)
                    .font(.largeTitle)
                    .bold()

                Text(job.company)
                    .font(.title3)

                Label(
                    job.location,
                    systemImage: "location.fill"
                )

                Text(job.salary)
                    .foregroundStyle(.green)
                    .font(.title2)

                Divider()

                Text("Job Description")
                    .font(.title2)
                    .bold()

                Text(job.descriptionText)
            }
            .padding()
        }
    }
}
