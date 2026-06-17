//
//  JobListView.swift
//  JobListing
//
//  Created by Pradip on 17/06/26.
//


import SwiftUI

struct JobListView: View {
    @StateObject var viewModel: JobListViewModel

    var body: some View {

        NavigationStack {

            ScrollView {

                LazyVStack(spacing: 16) {

                    ForEach(viewModel.filteredJobs) { job in

                        NavigationLink {
                            JobDetailView(job: job)
                        } label: {
                            JobCardView(job: job)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding()
            }
            .navigationTitle("Jobs")
            .navigationBarTitleDisplayMode(.large)
            .searchable(
                text: $viewModel.searchText,
                prompt: "Search jobs or companies"
            )
            .searchPresentationToolbarBehavior(.automatic)
        }
        .task {
            await viewModel.loadJobs()
        }
    }
}
