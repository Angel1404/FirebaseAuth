import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_test1/Provider/sing_in_provider.dart';
import 'package:prueba_test1/utils.dart';

class RolUserForm extends StatelessWidget {
  const RolUserForm({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final data = Provider.of<SingInProvider>(context);
    return BodyApp(
      title: (!data.now) ? 'CREATE YOUR PROFILE ' : data.rolUser,
      size: size,
      children: [
        if (!data.now)
          SizedBox(
            height: size.height * .2,
          ),
        if (!data.now) _InfoCard(data: data),
        if (data.now)
          const Text(
            'INFORMATION',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        if (data.now) const SizedBox(height: 20),
        if (data.now) _CardProfessional(data: data),
        if (data.now) const SizedBox(height: 80),
        if (data.now)
          Botton(
            colorBotton: Colors.teal,
            text: 'NEXT',
            ontap: () {
              data.enviarRegistroPro(context);
            },
          )
      ],
    );
  }
}

class _CardProfessional extends StatelessWidget {
  const _CardProfessional({
    Key? key,
    required this.data,
  }) : super(key: key);

  final SingInProvider data;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) {
                data.jobTitle = value;
              },
              decoration: InputDecoration(
                hintText: data.rolUser == 'PERSONAL' ? 'Name' : 'Job Title',
                hintStyle: TextStyle(
                  color: Colors.teal[200],
                ),
              ),
            ),
            TextFormField(
              keyboardType: (data.rolUser == 'PERSONAL') ? TextInputType.name : TextInputType.emailAddress,
              onChanged: (value) {
                if (data.rolUser == 'PERSONAL') {
                  data.surname = value;
                }
                data.email = value;
              },
              decoration: InputDecoration(
                hintText: (data.rolUser == 'PERSONAL') ? 'Surname' : 'Professional email',
                hintStyle: TextStyle(
                  color: Colors.teal[200],
                ),
              ),
            ),
            TextFormField(
              onChanged: (value) {
                if (data.rolUser == 'PERSONAL') {
                  data.interest = value;
                }
                data.compagy = value;
              },
              decoration: InputDecoration(
                hintText: (data.rolUser == 'PERSONAL') ? 'Interest' : 'Compagny',
                hintStyle: TextStyle(
                  color: Colors.teal[200],
                ),
              ),
            ),
            TextFormField(
              onChanged: (value) {
                if ((data.rolUser == 'PERSONAL')) {
                  data.email = value;
                }
                data.webSite = value;
              },
              decoration: InputDecoration(
                hintText: (data.rolUser == 'PERSONAL') ? 'Email' : 'Website link',
                hintStyle: TextStyle(
                  color: Colors.teal[200],
                ),
              ),
            ),
            TextFormField(
              keyboardType: (data.rolUser == 'PERSONAL') ? TextInputType.phone : TextInputType.streetAddress,
              onChanged: (value) {
                if ((data.rolUser == 'PERSONAL')) {
                  data.numberPhone = value;
                }
                data.address = value;
              },
              decoration: InputDecoration(
                hintText: (data.rolUser == 'PERSONAL') ? 'Phone Number' : 'Bunisse Address',
                hintStyle: TextStyle(
                  color: Colors.teal[200],
                ),
              ),
            ),
            TextFormField(
              keyboardType: (data.rolUser == 'PERSONAL') ? TextInputType.streetAddress : TextInputType.number,
              onChanged: (value) {
                if (data.rolUser == 'PERSONAL') {
                  data.address = value;
                }
                data.numberPhone = value;
              },
              decoration: InputDecoration(
                hintText: (data.rolUser == 'PERSONAL') ? 'Postal Address' : 'Phone number',
                hintStyle: TextStyle(
                  color: Colors.teal[200],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: const [
                _Redes(),
                SizedBox(width: 4),
                _Redes(texto: 'IN'),
                SizedBox(width: 4),
                _Redes(texto: 'FAB'),
                SizedBox(width: 4),
                _Redes(texto: 'TW'),
                SizedBox(width: 4),
                _Redes(texto: 'TIK'),
                SizedBox(width: 4),
                _Redes(texto: 'TEL'),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _Redes extends StatelessWidget {
  const _Redes({Key? key, this.texto = 'I'}) : super(key: key);
  final String texto;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.teal, width: 1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        texto,
        style: const TextStyle(color: Colors.teal),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  final SingInProvider data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'FILL UP YOUR PROFILE',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Botton(
                  isPadding: false,
                  colorBotton: Colors.white,
                  text: 'NOW',
                  colorText: Colors.teal,
                  alto: 35,
                  ontap: () {
                    data.now = true;
                  },
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Botton(
                  border: true,
                  isPadding: false,
                  colorBotton: Colors.teal,
                  text: 'LATER',
                  alto: 35,
                  ontap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
