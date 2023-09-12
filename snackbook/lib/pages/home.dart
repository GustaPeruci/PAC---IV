import 'package:flutter/material.dart';

import '../colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    final List<FeedItem> feedItems = [
      FeedItem(
        username: 'user1',
        image: 'assets/receitas/eisbein.jpg',
        title: 'Eisbein - Joelho de porco',
      ),
      FeedItem(
        username: 'user2',
        image: 'assets/receitas/bellemenuniere.jpg',
        title: 'Peixe à Belle Meunière',
      ),
      FeedItem(
        username: 'user3',
        image: 'assets/receitas/fileparmegiana.jpg',
        title: 'Filé à parmegiana',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Snackbook'),
        centerTitle: true,
        backgroundColor: kShrineGreen900,
        leading: IconButton(
          icon: Icon(Icons.list),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: feedItems.length,
        itemBuilder: (context, index) {
          final item = feedItems[index];
          return Card(
            elevation: 2.0,
            margin: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.asset(
                  item.image,
                  width: double.infinity,
                  height: 150.0,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.title,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.red,
                          size: 24.0,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class FeedItem {
  final String username;
  final String image;
  final String title;

  FeedItem({
    required this.username,
    required this.image,
    required this.title,
  });
}
