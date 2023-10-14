import 'package:flutter/material.dart';
import '../colors.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar perfil'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 10.0),
            Column(
              children: <Widget>[
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kSbGreen900,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.camera_alt),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Nome de Usuário',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Celular',
                  ),
                ),
                const SizedBox(height: 10),
                const TextField(
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'Bio',
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      width: 10.0,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Salvar',
                        style: TextStyle(color: kSbGreen50),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 8.0,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        backgroundColor: kSbGreen900,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
