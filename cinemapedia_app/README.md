# cinemapedia_app

This project is a simple app that uses the [MovieDB API](https://developers.themoviedb.org/3/getting-started/introduction) to fetch movies and display them in a list.

I made this app to learn good practices in software architecture and design. Here are some of the things I learned and implemented:

## Clean Architecture

I used the [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) to design this app. The main idea is to separate the different layers of the app in different packages. This way, the code is easier to understand and maintain.

The layers of the app are represented by:

    Entities:
        - Movie
