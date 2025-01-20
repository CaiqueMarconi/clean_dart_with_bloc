# clean_dart_with_bloc

# Mini Project: Clean Dart Architecture with ViaCEP API

This project demonstrates the implementation of a Clean Dart architecture using the [ViaCEP API](https://viacep.com.br/) to query Brazilian postal codes (CEPs). The structure adheres to well-defined layers—**Domain**, **Infrastructure**, **External**, and **Presenter**—ensuring a clean and scalable codebase. The state management is handled with **BLoC**, while **Modular** is used for dependency injection and routing control.

## Project Structure

The project is divided into the following layers:

### 1. **Domain**
- **Entities**: Defines core business models (e.g., `Address`).
- **UseCases**: Contains business logic for querying postal codes.

### 2. **External**
- Handles the integration with external services (e.g., ViaCEP API).
- Includes the implementation of HTTP requests.

### 3. **Infrastructure**
- Responsible for interfacing between the domain and external layers.
- Implements repositories defined in the domain layer.

### 4. **Presenter**
- Contains UI-related code and integrates with **BLoC** for state management.
- The interface is reactive and responds to state changes provided by **BLoC**.

## Technologies Used

- **Dart**: The programming language used throughout the project.
- **BLoC**: For state management and ensuring a reactive UI.
- **Modular**: For managing dependency injection and routing in a clean and modular way.
- **HTTP**: For handling API requests **DIO**.
- **ViaCEP API**: The external service used to fetch postal code data.

## Features

- Clean separation of concerns using the Clean Dart architecture.
- Real-time postal code query via the ViaCEP API.
- Modular design for scalable and maintainable development.
- Dependency injection and routing with Modular.
- Robust state management using BLoC.
- Comprehensive unit tests covering all layers, including **Domain**, **Infrastructure**, **External**, and **Presenter**, as well as **BLoC** tests.

## How to Run

1. Clone this repository:
   ```bash
   git clone <repository-url>
