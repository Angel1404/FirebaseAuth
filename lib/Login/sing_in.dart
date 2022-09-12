import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_test1/Provider/sing_in_provider.dart';

import '../utils.dart';

class SingIn extends StatelessWidget {
  const SingIn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final singIn = Provider.of<SingInProvider>(context);
    return BodyApp(
      title: 'SING IN',
      size: size,
      children: [
        const Text(
          'PHONE NUMBER',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextFormField(
            keyboardType: TextInputType.phone,
            onChanged: (value) {
              singIn.phone = value;
            },
            decoration: const InputDecoration(
              hintText: '+573221231231',
            ),
          ),
        ),
        SizedBox(height: size.height * .4),
        Botton(
          colorBotton: const Color.fromARGB(255, 44, 103, 46),
          text: 'SING IN',
          ontap: () async {
            await singIn.sendPhone(context);
          },
        ),
      ],
    );
  }
}
