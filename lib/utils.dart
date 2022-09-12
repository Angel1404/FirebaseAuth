import 'package:flutter/material.dart';

class BodyApp extends StatelessWidget {
  const BodyApp({
    Key? key,
    required this.size,
    required this.children,
    required this.title,
  }) : super(key: key);

  final Size size;
  final List<Widget> children;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              height: size.height * .9,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.teal[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          title,
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const Divider(
                          color: Colors.black,
                          thickness: 2,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * .15),
                  ...children
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Botton extends StatelessWidget {
  const Botton({
    Key? key,
    required this.colorBotton,
    required this.text,
    this.ontap,
    this.colorText = Colors.white,
    this.border = false,
    this.isPadding = true,
    this.alto = 50,
  }) : super(key: key);

  final Color colorBotton;
  final Color colorText;
  final String text;
  final Function()? ontap;
  final bool border;
  final bool isPadding;
  final double alto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: !isPadding ? 0 : 20),
      child: ElevatedButton(
        onPressed: ontap,
        style: ElevatedButton.styleFrom(
          primary: colorBotton,
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: !border
                ? BorderSide.none
                : const BorderSide(
                    color: Colors.white,
                    width: 2,
                  ),
            borderRadius: BorderRadius.circular(50),
          ),
          minimumSize: Size(double.infinity, alto),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: colorText,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
