# Zoink - Football Score App

Zoink is a sleek iOS app that allows football fans to view live scores. Powered by a custom network service, Zoink provides up-to-the-minute scores and match updates for football leagues.

## Features

- **Live Football Scores**: Real-time scores from football matches across multiple leagues and competitions
- **Robust Network Handling**: Advanced error handling and decoding for API responses
- **Easy to Use**: Minimalistic, clean interface designed for quick updates
- **Flexible Data Fetching**: Generic network service supporting various Codable types

## Requirements

- iOS 18.0 or later
- Xcode 16.0 or later
- Swift 6.0 or later
- Internet connection

## Installation & Setup

### 1. Clone the Repository

```bash
git clone https://github.com/Elliot727/Zoink.git
```

### 2. Football-Data.org API Configuration

#### Obtain API Key
1. Visit [Football-Data.org](https://www.football-data.org/)
2. Sign up for an account (free tier available)
3. Navigate to your API key page
4. Copy your unique API key

#### Configure Network Service
The app uses the Football-Data.org API through a robust `NetworkService`. 

1. Open `Core/Services/NetworkService.swift`
2. Locate the API key configuration:
```swift
let request = requestBuilder.addHeader(name: "X-Auth-Token", value: "YOUR_API_KEY_HERE").buildRequest()
```
3. Replace `"YOUR_API_KEY_HERE"` with your actual API key from Football-Data.org

### Network Service Features
- Integrates with Football-Data.org API
- Generic `fetch<T: Codable>` method for flexible data retrieval
- Detailed error logging for decoding issues
- HTTP status code validation
- Comprehensive error handling for various decoding scenarios

### 3. Build and Run

1. Open the project in Xcode
2. Choose your target device or simulator
3. Press `Cmd + R` to build and run the project

## Network Service Overview

```swift
class NetworkService: NetworkServiceProtocol {
    func fetch<T: Codable>(_ endpoint: URL) async throws -> T {
        // Detailed network and decoding logic
        // Supports comprehensive error handling
    }
}
```

### Error Handling Capabilities

The network service provides detailed error handling for:
- Type mismatches
- Missing values
- Missing keys
- Data corruption
- Unknown decoding errors

## Folder Structure

```
Zoink/
├── Core/
│   ├── Services/
│   │   └── NetworkService.swift
│   └── Models/
│       ├── Match.swift
│       └── LeagueTablwEntry.swift
├── Features/
│   ├── NoMatchesView.swift
│   └── BackgroundView.swift
├── Assets/
```

## Contribution Guidelines

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Open a pull request

### Reporting Issues

- Provide clear, detailed bug reports
- Include steps to reproduce
- Share any relevant error messages

## Contact

- X: [@CodeWithElliot](https://x.com/CodeWithElliot)
- GitHub: [@Elliot727](https://github.com/Elliot727)

---

**Enjoy tracking football scores with Zoink!**
