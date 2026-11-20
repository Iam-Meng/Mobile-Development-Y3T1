import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Favorite cards"),
      ),
      body: Column(
        children: [
          FavouriteCard(title: 'title', description: 'description'),
          FavouriteCard(title: 'title', description: 'description'),
          FavouriteCard(title: 'title', description: 'description'),
      ]),
    ),
  ),
);

class FavouriteCard extends StatefulWidget {
  final String title;
  final String description;
  const FavouriteCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  State<FavouriteCard> createState() => _FavouriteCardState();
}

class _FavouriteCardState extends State<FavouriteCard> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Text(widget.description, style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                isFavourite = !isFavourite;
              });
            },
            icon: Icon(
              isFavourite? Icons.favorite : Icons.favorite_border,
              color: isFavourite ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
