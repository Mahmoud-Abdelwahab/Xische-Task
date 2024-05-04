# Overview
This project is a modular iOS application developed in Swift and UIKit following the VIPER architecture. It consists of two modules, Module A and Module B, each containing a single screen - a listing screen and a details screen, respectively. The application fetches data from an external API and caches it locally using Realm. It also includes offline support by retrieving data from the local cache in case of API failure.


https://github.com/Mahmoud-Abdelwahab/XschieTask/assets/17813115/744db2d2-61d9-4b84-9d18-a13b843fe0a7


# Modules
# Module A (Listing Screen)
This module contains a listing screen that displays data fetched from an external API. It handles API requests and caching data locally using Realm. In case of API failure, it retrieves data from the local cache.

# Module B (Details Screen)
This module contains a details screen that displays detailed information about an item selected from the listing screen in Module A. It allows the user to refresh the listing screen in Module A.

# Architecture
The application follows the VIPER architecture to ensure modularity, separation of concerns, and ease of maintenance. Each module consists of the following components:

- View: Responsible for displaying the user interface and handling user interactions.
- Interactor: Manages the business logic and communicates with the data layer.
- Presenter: Mediates between the view and the interactor, formatting data for display.
- Router: Handles navigation between screens and modules.

# Features
- Modular architecture for code organization and scalability.
- VIPER architecture for clear separation of concerns.
- Use of Realm for local data caching.
- Network requests handled using URLSession.
- Offline support by retrieving data from local cache in case of API failure.
- Simple UI design to focus on functionality.
- added some unite tests

# Requirements
- Xcode 15.0.1
- XCode instruments leak tool
- UIKit framework
- RealmSwift framework

# Installation
To run the application:

- Clone the repository from GitHub.
- Open the project in Xcode.
- Build and run the application on a simulator or device.

# Usage
- Clone App from Main Branch
- Upon launching the application, Module A's listing screen will be displayed.
- Module A fetches data from the external API and caches it locally using Realm.
- If the API request fails, Module A retrieves data from the local cache.
- Tap on an item in the listing screen to navigate to Module B's details screen.
- Module B displays detailed information about the selected item.
- Tap the refresh button in Module B to dismiss Details screen then refresh of Module A's listing screen.
- The API dosnt support pagination and also i make the coutry as Constant UAE because no place in the UI we can change the country from it
  
# Notes; - 
- I created main app and two sub frameworks for the two screens 
- I used just on repositoy we can publish each framwork in single repositoy and add to as submodule in this main repo here
- The navigation between modules handled in MainAppRouter
- We can use swiftGen to auto generate assets for each modus 
- We can  add network layer  and realm manager in separate core SPM and import it in the framwork that uses it  
- I used repositoy to check if there is no internet it gets data from cache if there is intenet it gets data from api request and cache it in realm DB as suggested 
- I used two different  ui models  for list and details to ensure separation of concerns 
- Tried to apply solid  as much as i could 
- Any module need to use realm or network service it needs to create protocol to use it throught protocols ... and realm manager, network service implements this protocol 
- app free from memeory leaks i tested it using XCode instruments leak tool
