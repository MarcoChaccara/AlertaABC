

import 'package:alerta_abc/pages/home_page.dart';
import 'package:alerta_abc/pages/register_page.dart';
import 'package:alerta_abc/ui/general/colors.dart';
import 'package:alerta_abc/ui/widgets/button_custom_widget.dart';
import 'package:alerta_abc/ui/widgets/button_normal_widget.dart';
import 'package:alerta_abc/ui/widgets/general_widgets.dart';
import 'package:alerta_abc/ui/widgets/textfield_normal_widget.dart';
import 'package:alerta_abc/ui/widgets/textfield_password_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  _login() async {
    try {
      if (formKey.currentState!.validate()) {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        if (userCredential.user != null) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
            (route) => false);
        }
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == "invalid-email") {
        showSnackBarError(context, "El correo electrónico es inválido");
      } else if (error.code == "user-not-found") {
        showSnackBarError(context, "El usuario no está registrado");
      } else if (error.code == "wrong-password") {
        showSnackBarError(context, "La contraseña es incorrecta");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  divider30(),
                  // SvgPicture.asset('assets/images/login.svg',
                  // height: 180.0,
                  // ),

                  // Image.asset('assets/images/login.png'),
                  // Image.network('https://cdn-icons-png.flaticon.com/512/5087/5087579.png'),
                  divider30(),
                  Text(
                    "Iniciar Sesión",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      color: kBrandPrimaryColor,
                    ),
                  ),
                  divider10(),
                  TextFieldNormalWidget(
                    hintText: "Correo electrónico",
                    icon: Icons.email,
                    controller: _emailController,
                  ),
                  divider10(),
                  TextFieldPasswordWidget(
                    controller: _passwordController,
                  ),
                  divider20(),
                  ButtonCustomWidget(
                    text: "Iniciar Sesión",
                    color: kBrandPrimaryColor,
                    icon: "",
                    onPressed: () {
                      _login();
                    },
                  ),
                  divider20(),
                  Text(
                    "O ingresa con tus redes sociales",
                  ),
                  divider20(),
                  ButtonCustomWidget(
                    text: "Iniciar sesión con Google",
                    icon: "google",
                    color: Color(0xfff84b2a),
                    onPressed: () {},
                  ),
                  divider20(),
                  ButtonCustomWidget(
                    text: "Iniciar sesión con Facebook",
                    icon: "facebook",
                    color: Color(0xff507cc0),
                    onPressed: () {},
                  ),
                  divider20(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "¿Aún no estás registrado?",
                      ),
                      divider10Width(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()));
                        },
                        child: Text(
                          "Regístrate",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: kBrandPrimaryColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
