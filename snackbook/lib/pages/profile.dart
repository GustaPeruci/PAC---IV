import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _username = '';
  String _fullName = '';
  String _phone = '';
  String _bio = '';

  @override
  void initState() {
    super.initState();
    // Fetch the user's data and update the state
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .get();

      if (userDoc.exists) {
        setState(() {
          _username = userDoc['username'] ?? '';
          _fullName = userDoc['fullName'] ?? '';
          _phone = userDoc['phone'] ?? '';
          _bio = userDoc['bio'] ?? '';
        });
      }
    }
  }

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
            Text(
              _username,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              _fullName,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            Text(
              _phone,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Text(
              _bio,
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
          ],
        ),
      ),
    );
  }
}
