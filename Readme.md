# The challenge
## Goal
Build a simple movie browser app using **Swift 5+** and **SwiftUI**.  
Load a list of movies, navigate to a details screen, show recommended movies, and support “likes”.
Functionality and code quality matter more than pixel perfection.

## Tested On
- iOS 17 minimum 
- iPhone 16 Pro simulator (iOS 18.6)

## What I Would Do Next
- Add search to handle large lists
- Improve accessibility
- Support creating a new movie entry

## Tradeoffs
- I chose to set up my file structure based on the MVVM architecture knowing this is a small project to keep it simple. However, to support scale, I would change the structure to be based on feature modules.
- Using generics for `requestData` in `APIClient` makes it really easy to use the same request function for all endpoints, but it can get messier if there are different kinds of decoders being used or more complex processes.
- Using `UserDefaults` to persist favorites. It is ideal with a small number of movies, but it does not perform well in large sets. UserDefaults are also not encrypted, so they are not recommended for sensitive information.
- I chose to use KingFisher instead of `AsyncImage` to cache the images instead of making a network response each time. Using a third party adds a level of complexity in maintenance, but in this case it was a simple solution that improved the app performance.

## Requirements
- **Language & UI:** Swift 5+, SwiftUI.
- **Concurrency:** Use Swift Concurrency (`async/await`).
- **Package Management:** Swift Package Manager.
- **Architecture:** MVVM or a similarly clean pattern.
- **Networking:** Handle loading, error, and empty states gracefully.
- **Environment:** In your README, specify the **Xcode version**, **iOS version**, and **device/simulator model** you used for testing.
- **Repo:** Fork this repo and keep your fork public until review.

## API
- **List:**  
  `https://raw.githubusercontent.com/TradeRev/tr-ios-challenge/master/list.json`  

- **Details:**  
  `https://raw.githubusercontent.com/TradeRev/tr-ios-challenge/master/details/{id}.json`  

- **Recommended:**  
  `https://raw.githubusercontent.com/TradeRev/tr-ios-challenge/master/details/recommended/{id}.json`  

## What to Build
- **Movie List:** fetch and display the list.
- **Details Screen:** show details for a movie and its recommendations.
- **Navigation:** tapping a recommended movie opens its details.
- **Likes:** allow marking a movie as liked/favorited and reflect this state across list and details (persist locally; your choice of method).

## Bonus
- Unit tests.
- Lightweight caching (e.g., images or responses).
- Dark Mode support.
- Brief README notes on trade-offs and “what you’d do next”.