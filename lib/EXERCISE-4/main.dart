import 'package:flutter/material.dart';

import 'data/jokes.dart';

Color appColor = Colors.green[300] as Color;

void main() => runApp(const MaterialApp(home: JokesApp()));

// Parent widget - holds the favorite joke state
class JokesApp extends StatefulWidget {
  const JokesApp({super.key});

  @override
  State<JokesApp> createState() => _JokesAppState();
}

class _JokesAppState extends State<JokesApp> {
  // Store the index of the favorite joke (null = no favorite)
  int? favoriteJokeIndex;

  // Function to set a joke as favorite
  void setFavorite(int index) {
    setState(() {
      // If clicking the same joke, unfavorite it
      if (favoriteJokeIndex == index) {
        favoriteJokeIndex = null;
      } else {
        // Otherwise, set this joke as favorite
        favoriteJokeIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text("Favorite Jokes"),
      ),

      body: ListView.builder(
        itemCount: jokes.length,
        itemBuilder: (context, index) {
          return FavoriteCard(
            joke: jokes[index],
            isFavorite: favoriteJokeIndex == index,
            onFavoriteClick: () => setFavorite(index),
          );
        },
      ),
    );
  }
}

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({
    super.key,
    required this.joke,
    required this.isFavorite,
    required this.onFavoriteClick,
  });

  final Joke joke;
  final bool isFavorite;
  final Function() onFavoriteClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: .5, color: Colors.grey)),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  joke.title,
                  style: TextStyle(
                    color: appColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(joke.description),
              ],
            ),
          ),
          IconButton(
            onPressed: onFavoriteClick,
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
