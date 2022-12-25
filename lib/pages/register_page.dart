import 'package:alerta_abc/ui/general/colors.dart';
import 'package:alerta_abc/ui/widgets/button_custom_widget.dart';
import 'package:alerta_abc/ui/widgets/general_widgets.dart';
import 'package:alerta_abc/ui/widgets/textfield_normal_widget.dart';
import 'package:alerta_abc/ui/widgets/textfield_password_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();

  _registerUser() async {
    UserCredential userCredential =   await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: "zzoids3@gmail.com",
      password: "marcoant",
    );
    print(userCredential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              divider30(),
              // SvgPicture.asset(
              //   'assets/images/register.svg',
              //   height: 180.0,
              // ),
              divider30(),
              Text(
                "Regístrate",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: kBrandPrimaryColor,
                ),
              ),
              divider20(),
              TextFieldNormalWidget(
                hintText: "Nombre completo",
                icon: Icons.email,
                controller: _fullNameController,
              ),
              divider10(),
              divider6(),
              TextFieldNormalWidget(
                hintText: "Correo electrónico",
                icon: Icons.email,
                controller: _emailController,
              ),
              divider10(),
              divider6(),
              TextFieldPasswordWidget(
                controller: _passwordController,
              ),
              divider20(),
              ButtonCustomWidget(
                text: "Regístrate ahora",
                icon: "check",
                color: kBrandPrimaryColor,
                onPressed: (){
                  _registerUser();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
