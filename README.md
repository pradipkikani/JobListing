# Job Listing iOS Application

## Overview

Job Listing is a production-ready iOS application built using SwiftUI and MVVM architecture. The application allows users to browse available jobs, search by title or company name, and view detailed job information.

The project demonstrates modern iOS development practices including:

* SwiftUI
* MVVM Architecture
* SwiftData Persistence
* Dependency Injection
* Async/Await
* Repository Pattern
* Unit Testing using Swift Testing
* Search Functionality
* Loading, Empty, and Error States

---

## Features

### Job Listing Screen

* Display available jobs
* Company name
* Location
* Salary range
* Responsive and reusable job cards

### Search

Search jobs by:

* Job title
* Company name

### Job Details

Displays:

* Job title
* Company information
* Location
* Salary range
* Full job description

### State Management

Handles:

* Loading State
* Empty State
* Error State

### Offline Support

* Data is loaded from a local JSON file
* Cached using SwiftData
* Faster subsequent launches

---

## Architecture

The application follows the MVVM (Model-View-ViewModel) pattern.

### Architecture Diagram

AppCoordinator

↓

JobListView

↓

JobListViewModel

↓

JobRepositoryProtocol

↓

JobRepository

↓

LocalJSONService

↓

jobs.json

### Layers

#### Presentation Layer

Responsible for UI rendering.

* JobListView
* JobDetailView
* Reusable Components

#### ViewModel Layer

Responsible for:

* Business logic
* State management
* Search functionality

#### Data Layer

Responsible for:

* Local JSON parsing
* Data mapping
* SwiftData persistence

#### Persistence Layer

SwiftData is used to cache job records locally.

---

## Project Structure

JobListing

├── App

├── Core

│ ├── DI

│ ├── Utilities

│ └── ViewState

├── Domain

│ └── Models

├── Data

│ ├── Repository

│ ├── Services

│ └── DTOs

├── Presentation

│ ├── JobList

│ ├── JobDetail

│ └── Components

├── Resources

│ └── jobs.json

└── Tests

---

## Setup Instructions

### Requirements

* Xcode 16+
* iOS 17+
* Swift 6

### Clone Repository

git clone https://github.com/pradipkikani/JobListing.git

### Open Project

Open:

JobListing.xcodeproj

### Run Application

1. Select iPhone Simulator
2. Press Cmd + R

### Run Tests

Press:

Cmd + U

or

Product → Test

---

## Dependencies

No third-party dependencies are used.

The project relies entirely on Apple's native frameworks:

* SwiftUI
* SwiftData
* Foundation
* Testing Framework

---

## Assumptions Made

### Data Source

A local JSON file is used as the primary data source to keep the application self-contained and reliable during evaluation.

### Offline Caching

Jobs are cached in SwiftData after the first load.

If cached data exists, the repository returns cached data instead of reloading the JSON file.

### Search Scope

Search functionality is limited to:

* Job Title
* Company Name

Location and salary filtering were considered out of scope for the assignment.

### Pagination

Pagination was not implemented because the provided dataset is local and relatively small.

However, the repository and ViewModel structure are designed to support pagination in future enhancements.

### Authentication

User authentication is outside the scope of this assignment.

---

## Testing

The following areas are covered:

### ViewModel Tests

* Successful data load
* Empty state
* Error state
* Search by title
* Search by company
* Case-insensitive search

### Repository Tests

* Data fetch
* SwiftData cache validation

### JSON Service Tests

* JSON parsing
* Mapping validation

Business logic coverage exceeds 70%.

---

## Future Improvements

* Remote API Integration
* Pagination
* Advanced Filters
* Sorting Options
* Company Logos
* Pull to Refresh
* Skeleton Loading Views
* Deep Linking
* SwiftLint
* CI/CD with GitHub Actions

---

## Author

Pradip Kikani

Senior iOS Developer

9+ Years of Experience in Mobile Application Development
