import 'package:flutter/material.dart';
import '../colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            color: kSbGreen900,
            onPressed: () {
              Navigator.of(context).pushNamed('/settings');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kSbGreen900,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Nome do usuário',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Nome completo',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Celular',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Biografia do usuário',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              style: TextButton.styleFrom(textStyle: TextStyle(fontSize: 16)),
              onPressed: () {
                Navigator.of(context).pushNamed('/editProfile');
              },
              child: const Text(
                'Editar perfil',
                style: TextStyle(color: kSbGreen900),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.favorite),
                        color: kSbGreen900,
                        onPressed: () {},
                      ),
                      Text(
                        "Curtidas",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(width: 50),
                      IconButton(
                        icon: Icon(Icons.book),
                        color: kSbGreen900,
                        onPressed: () {},
                      ),
                      Text(
                        "Posts",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
