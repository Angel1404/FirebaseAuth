import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_test1/Provider/sing_in_provider.dart';
import 'package:prueba_test1/utils.dart';

class CodePage extends StatelessWidget {
  const CodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final code = Provider.of<SingInProvider>(context);
    return BodyApp(
      size: size,
      title: 'SING IN',
      children: [
        const Text(
          '6 DIGITS CODE',
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
            keyboardType: TextInputType.number,
            onChanged: (value) {
              code.code = value;
            },
          ),
        ),
        SizedBox(height: size.height * .4),
        Botton(
          colorBotton: const Color.fromARGB(255, 44, 103, 46),
          text: 'SING IN',
          ontap: () async {
            await code.validateCode(context);
          },
        ),
      ],
    );
  }
}
