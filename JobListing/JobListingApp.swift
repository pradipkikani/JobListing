//
//  JobListingApp.swift
//  JobListing
//
//  Created by Pradip on 17/06/26.
//

import SwiftUI
import SwiftData

@main
struct JobListingApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {

          WindowGroup {
              AppCoordinator()
          }
          .modelContainer(
              for: Job.self
          )
      }
}

struct AppCoordinator: View {

    @Environment(\.modelContext)
    private var context

    var body: some View {

        let repository = JobRepository(
            service: LocalJSONService(),
            context: context
        )

        JobListView(
            viewModel: JobListViewModel(
                repository: repository
            )
        )
    }
}
