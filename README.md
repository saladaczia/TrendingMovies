
# Application Name: TrendingMovies

TrendingMovies is an iOS application written in Swift that displays a table view of popular movies. It follows the Model-View-Controller (MVC) design pattern and utilizes various frameworks and tools to enhance its functionality.


## Features
The TrendingMovies application offers the following features:

- Trending Movies List: The application fetches data from an API to retrieve a list of currently popular movies.
- Image Caching: The application uses the Kingfisher framework to efficiently cache and display movie poster images.
- Network Requests: Alamofire, a popular networking framework, is employed to handle network requests and retrieve movie data from the API.
- User Interface: The application uses UIKit to build the user interface, including the table view for displaying the movie list.

## Technologies and Tools

TrendingMovies leverages the following technologies and tools:

**Swift Package Manager:** Used for dependency management, allowing easy integration of external libraries such as Alamofire and Kingfisher.

**Alamofire:** A Swift-based HTTP networking library used for making network requests and retrieving movie data from the API.

**Kingfisher:** A powerful Swift library used for downloading and caching images, optimizing the loading of movie poster images.

**UIKit:** The main framework for building the user interface, including table views and navigation controllers.

**MVC (Model-View-Controller):** The architectural pattern followed by the application, ensuring separation of concerns and modularity.
## How to Run the Application

To run the TrendingMovies application, follow these steps:


1. Clone the TrendingMovies repository to your local machine.

```bash
  git clone https://github.com/saladaczia/TrendingMovies.git
```

2. Open the terminal and navigate to the cloned repository directory.

```bash
  cd <path-to-directory>

```

3. Install dependencies using Swift Package Manager.

```bash
  swift package resolve

```

4. Open the TrendingMovies.xcodeproj project file in Xcode.
5. Build and run the application on a simulator or a connected device.



## Summary

TrendingMovies is a Swift-based iOS application that displays a table view of popular movies. It follows the MVC design pattern and utilizes Alamofire and Kingfisher frameworks for networking and image caching, respectively. The user interface is built using UIKit, providing an intuitive experience for users to browse through popular movies.


## Screenshots

![Simulator Screen Shot - iPhone 14 Pro - 2023-06-14 at 13 52 35](https://github.com/saladaczia/TrendingMovies/assets/75745541/8433a245-e5a8-464c-ab0f-d9135cebbb3b)
