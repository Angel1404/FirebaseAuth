import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_test1/utils.dart';

import '../Provider/sing_in_provider.dart';

class SkillsPage extends StatelessWidget {
  const SkillsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final data = Provider.of<SingInProvider>(context);

    return BodyApp(
      size: size,
      title: 'SING IN',
      children: [
        Botton(
          colorBotton: const Color.fromARGB(255, 44, 103, 46),
          text: 'PROFESSIONAL',
          ontap: () {
            data.rolUser = 'PROFESSIONAL';
            Navigator.pushNamed(context, 'formulario');
          },
        ),
        const SizedBox(height: 20),
        Botton(
          colorBotton: const Color.fromARGB(255, 44, 103, 46),
          text: 'PERSONAL',
          ontap: () {
            data.rolUser = 'PERSONAL';
            Navigator.pushNamed(context, 'formulario');
          },
        ),
        const SizedBox(height: 20),
        Botton(
          colorBotton: const Color.fromARGB(255, 44, 103, 46),
          text: 'BOTH',
          ontap: () {
            data.rolUser = 'BOTH';
            Navigator.pushNamed(context, 'formulario');
          },
        ),
        SizedBox(height: size.height * .2),
        const Botton(colorBotton: Color.fromARGB(255, 44, 103, 46), text: 'SIGN IN')
      ],
    );
  }
}
