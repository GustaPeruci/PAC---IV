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
        backgroundColor: kSbGreen900,
        leading: IconButton(
          icon: Icon(Icons.list),
          onPressed: () {
            Navigator.of(context).pushNamed('/receita');
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).pushNamed('/profile');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: feedItems.length,
        itemBuilder: (context, index) {
          final item = feedItems[index];
          return Card(
            elevation: 2.0,
            margin: EdgeInsets.all(30.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/recipesInfos');
                      },
                      child: Image.asset(
                        item.image,
                        width: double.infinity,
                        height: 400.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      right: 8,
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.title,
                        style: TextStyle(fontSize: 16.0),
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
