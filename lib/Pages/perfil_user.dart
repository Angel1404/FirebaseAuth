import 'package:flutter/material.dart';
import 'package:prueba_test1/utils.dart';

class PerfilUser extends StatelessWidget {
  const PerfilUser({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BodyApp(size: size, title: 'PERSONAL && PROFESSIONAL', children: [
      const SizedBox(height: 50),
      const Text(
        'PROFILE PICTURE',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 50),
      const Icon(Icons.person, size: 100),
      const SizedBox(height: 40),
      Botton(
        colorBotton: Colors.teal,
        text: 'ADD PICTURE',
        ontap: () {},
      ),
      const SizedBox(height: 20),
      Botton(
        colorBotton: Colors.teal,
        text: 'LATER',
        ontap: () {},
      ),
    ]);
  }
}
