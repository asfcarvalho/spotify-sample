# spotify-sample

This app sample lists the top 10 less played song from an specific artist that users search for.

* It's a VIPER pattern inspiration, I used viewcontroller, presenter, wireframe and model.

### Getting Started

When you open the app, you'll be headed to your Spotify account. To proceed with the use of the app you must accept the terms and return to the app, it will show your playlist and the search bar. Search and find out the top 10 least played songs from a chosen artist.



* The first screen  will show you a button if you don't accept the  terms. The app requires users to accept the terms to proceed app use.

* The second screen shows the search bar and the table list, the first request returns the current user’s playlist.

* Use the search bar to research for an artist and the request returns the top 10 of least played songs from the artist you chose.
- The  button "Back to My Playlist", will send you to the fist screen if you click it.
- I used the URI: "https://api.spotify.com/v1/artists/\(artist)/top-tracks?country=BR" to show the top 10 least played. in the results, i reorder from the least played to most played.

* There is an image of the album,  the name of the song, the name of the album, the name of the artist, the duration time and one button play/pause.

### Running the tests

* Open the Spotify app, this is a requisite to play and pause the song and to see the currently played song.


### Built With

* URLRequest - the API request framework
