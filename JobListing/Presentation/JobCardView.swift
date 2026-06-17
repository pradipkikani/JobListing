//
//  JobCardView.swift
//  JobListing
//
//  Created by Pradip on 17/06/26.
//


import SwiftUI

struct JobCardView: View {
    let job: Job
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [.blue,.purple],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame( width: 50, height: 50 )
                
                VStack(
                    alignment: .leading
                ) {
                    
                    Text(job.title)
                        .font(.headline)
                    Text(job.company)
                        .foregroundStyle(.secondary)
                }
                Spacer()
            }
            
            Label(
                job.location,
                systemImage: "location"
            )
            
            Text(job.salary)
                .fontWeight(.bold)
                .foregroundStyle(.green)
            
        }
        .padding()
        .background(.background)
        .clipShape(
            RoundedRectangle(
                cornerRadius: 24
            )
        )
        .shadow(
            color: .black.opacity(0.1),
            radius: 10
        )
    }
}
