# Tasks Manager App

## Overview

The Tasks Manager app is a simple task management application that allows users to view, add, update, and delete todos. This project was developed as a test for applying to Maids.
This Project can be used as a Base Project for large Projects.

## Features

- View a list of todos fetched from an API
- Add new todos
- Update existing todos
- Delete todos
- Offline support: cache todos locally to handle no internet connection scenarios

## Design Decisions

### Architecture

The app is built using the Clean Architecture pattern, which separates the code into different layers:
- **Presentation Layer**: Manages the UI and user interactions using Flutter and BLoC for state management.
- **Domain Layer**: Contains the business logic and entities.
- **Data Layer**: Handles data fetching from remote and local sources.

### State Management

The BLoC (Business Logic Component) pattern is used for state management, providing a clear separation between business logic and UI components.

### Offline Support

To handle offline scenarios, todos are cached locally using the `shared_preferences` package. This allows the app to display cached todos when there is no internet connection.

## Challenges Faced

- **State Management**: Implementing BLoC to handle multiple operations (fetch, add, update, delete) efficiently was challenging. Ensuring the UI reflects the correct state in all scenarios required careful planning and testing.
- **Offline Support**: Ensuring seamless offline support required handling synchronization between remote and local data sources, especially managing the state when transitioning between offline and online modes.
- **Error Handling**: Providing a robust error handling mechanism to inform users of any issues during data fetching or operations was crucial for a good user experience.

## Additional Features

- **Loading Indicators**: Implemented specific loading indicators for different operations (fetching, adding, updating, deleting) to improve user experience.
- **Improved UI**: Added various UI enhancements to make the app more user-friendly and intuitive.

## Getting Started

### Prerequisites

- Flutter SDK
- Dart

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/mhdamhd/tasks_manager.git

2. Navigate to the project directory:
    ```bash
   cd todos_manager

3. Install dependencies::
    ```bash
   flutter pub get

### Running the App
1. Start the development server:
   ```bash
   flutter run

### Testing
1. Unit tests were written for the BLoCs to ensure the correctness of the business logic. To run the tests, use the following command:
   ```bash
   flutter test

### Conclusion

This project demonstrates my ability to design and implement a robust Flutter application using clean architecture principles and BLoC for state management. It also highlights my problem-solving skills in handling offline support and providing a seamless user experience.

### Contact

For any questions or further information, please contact Mohammad Mohammad at mhd.aeoub.mhd@gmail.com.