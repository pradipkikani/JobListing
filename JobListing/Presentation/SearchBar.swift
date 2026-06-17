//
//  SearchBar.swift
//  JobListing
//
//  Created by Pradip on 17/06/26.
//


import SwiftUI

struct SearchBar: View {

    @Binding var text: String

    var body: some View {

        HStack {

            Image(systemName: "magnifyingglass")

            TextField(
                "Search jobs...",
                text: $text
            )
        }
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(Capsule())
    }
}
