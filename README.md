## Repository: SwiftUI Clean Architecture with TMDB API

Welcome to my **SwiftUI Clean Architecture** repository! This project is a comprehensive example of how to build a scalable and maintainable iOS application using **SwiftUI**, **Clean Architecture**, and the **TMDB (The Movie Database) API**. Whether you're a beginner looking to understand modern app architecture or an experienced developer seeking a solid reference, this repository has something for you.

### 📚 About the Project

In this project, I demonstrate how to implement **Clean Architecture** principles within a SwiftUI application. Clean Architecture helps in organizing your codebase into distinct layers, promoting separation of concerns, and making the app easier to test and maintain. By integrating the **TMDB API**, the app fetches and displays a list of movies, showcasing real-world API integration and data handling.

### 🚀 Features

- **SwiftUI Integration**: Leverage the power of SwiftUI for building dynamic and responsive user interfaces.
- **Clean Architecture**: Structured into Presentation, Domain, and Data layers to ensure a clear separation of concerns.
- **TMDB API Integration**: Fetch and display movie data, including popular movies, movie details, and search functionality.
- **Dependency Injection**: Enhance testability and modularity by injecting dependencies.
- **Unit Testing**: Comprehensive tests for critical components to ensure reliability and robustness.

### 🏗️ Architecture Overview

The repository follows the **Clean Architecture** pattern, divided into three main layers:

1. **Presentation Layer**
   - **Views**: SwiftUI views that define the user interface.
   - **ViewModels**: Handle the presentation logic and interact with use cases.

2. **Domain Layer**
   - **Entities**: Core business models.
   - **Use Cases**: Define the application's business rules and interact with repositories.

3. **Data Layer**
   - **Repositories**: Handle data operations, fetching data from the TMDB API.
   - **Networking**: Manage API calls and data serialization.

### 🛠️ Getting Started

To get started with this project, follow these steps:

1. **Clone the Repository**
   ```bash
   git clone https://github.com/octavvia/tmdb-clean-architecture.git
   ```
2. **Open in Xcode**
   Navigate to the project directory and open the `.xcodeproj` file with Xcode.

3. **Configure API Key**
   - Obtain an API key from [TMDB](https://www.themoviedb.org/documentation/api).
   - Add your API key to the project's configuration as instructed in the repository's README.

4. **Build and Run**
   Select the desired simulator or device and run the app.

### 📝 Learn More

For an in-depth, step-by-step guide on building this project and understanding the underlying concepts of Clean Architecture with SwiftUI, check out my [Medium article](https://medium.com/@authfy/step-by-step-swiftui-with-clean-architecture-a54440f39fae). The article walks you through the entire development process, providing valuable insights and best practices.

### 🤝 Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, feel free to open an issue or submit a pull request.

### 📄 License

This project is licensed under the [MIT License](LICENSE).

---

Thank you for visiting my repository! I hope this project helps you in your journey to mastering SwiftUI and Clean Architecture. Happy coding!
