# Gyll : Coastal Weather Safety Checker

#### Overview

The Coastal Weather Safety Checker is a Flutter application designed to provide users with information about the safety of traveling to a coastal region based on current weather conditions. The app determines the user's current location, identifies the Indian state they are in, checks if that state has a coastal region, and then fetches and displays the weather information to assess travel safety.

#### Key Features

1. Location Detection: 
   - Utilizes the device's GPS to determine the user's current location.

2. State Identification: 
   - Maps the user's coordinates to an Indian state using a static coordinate mapping. For better accuracy, a reverse geocoding service should be considered in a real-world application.

3. Coastal Region Check:
   - Identifies if the detected state is a coastal region from a predefined list of coastal states in India.

4. Weather Forecast:
   - Fetches real-time weather data from OpenWeatherMap API using the state name.
   - Evaluates the safety of traveling based on temperature, providing feedback on whether it is safe to travel or not.

5. User Interface:
   - Displays the current weather conditions, temperature, and safety assessment in a simple and user-friendly interface.

#### How It Works

1. Initialization:
   - The app initializes and loads the OpenWeatherMap API key from a `.env` file for secure API access.

2. Fetching Location:
   - The app requests location permissions and retrieves the user's current GPS coordinates.

3. State Mapping:
   - The app uses a predefined mapping of coordinates to states. For each set of coordinates, it looks up the corresponding state. (Note: For more accurate results, use reverse geocoding services.)

4. Coastal Check:
   - The app checks if the identified state is in a list of coastal states.

5. Weather Data Retrieval:
   - Sends a request to the OpenWeatherMap API to get current weather conditions for the identified state.
   - Analyzes the weather data to determine if travel is safe based on temperature and weather conditions.

6. Display Results:
   - Shows the weather description, temperature, and safety recommendation to the user.

#### Dependencies

- Geolocator: For retrieving the user's current GPS location.
- HTTP: For making network requests to the OpenWeatherMap API.
- Flutter Dotenv: For managing environment variables like the API key securely.

#### Setup Instructions

1. API Key:
   - Obtain an API key from OpenWeatherMap and add it to the `.env` file in the root directory of the project.

2. Dependencies:
   - Add the required dependencies to your `pubspec.yaml` file and run `flutter pub get` to install them.

3. Permissions:
   - Ensure location permissions are handled correctly in the Android and iOS configurations.

#### Usage

1. Run the App:
   - Launch the app on a physical device or emulator. The app will automatically request location permissions and fetch the user's current location.

2. View Results:
   - The app will determine the user's state, check if it is coastal, fetch the weather data, and display the results on the screen.

#### Future Enhancements

- Reverse Geocoding: Integrate a reverse geocoding API for accurate state identification from coordinates.
- Extended Coordinates Mapping: Expand the coordinate mapping to cover more cities and regions for better coverage.
- Safety Criteria: Enhance safety criteria based on more detailed weather parameters and user preferences.

This project provides a foundation for location-based weather checking and safety assessment, suitable for users planning trips to coastal regions in India.



## Installation Guide

## Flutter

1. Download Flutter SDK
   - Visit the [Flutter website](https://flutter.dev/docs/get-started/install) and download the stable release for your operating system.

2. Extract the SDK
   - Unzip the downloaded file and place the `flutter` directory in your preferred location.

3. Add Flutter to PATH
   - Add the `flutter/bin` directory to your system PATH:
     - macOS/Linux:
       ```bash
       export PATH="$PATH:`<path-to-flutter-directory>/flutter/bin`"
       ```
       Add this line to your shell profile (`~/.bashrc`, `~/.zshrc`, etc.) for persistence.
     - Windows: 
       Search for "Environment Variables" in the Start menu and add a new system variable with the name `Path` and value `<path-to-flutter-directory>\flutter\bin`.

4. Run Flutter Doctor
   - Open a terminal or command prompt and run:
     ```bash
     flutter doctor
     ```
   - Follow any additional setup instructions provided.

## Programming language and tools used
<p align="left"> <a href="https://dart.dev" target="_blank" rel="noreferrer"> <img src="https://www.vectorlogo.zone/logos/dartlang/dartlang-icon.svg" alt="dart" width="40" height="40"/> </a> <a href="https://flutter.dev" target="_blank" rel="noreferrer"> <img src="https://www.vectorlogo.zone/logos/flutterio/flutterio-icon.svg" alt="flutter" width="40" height="40"/> </a></p>

## Developer
   [@abhineetraj1](https://github.com/abhineetraj1)
