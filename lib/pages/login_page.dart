import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proyecto_final/pages/home_page.dart';
import 'package:proyecto_final/ui/general/colors.dart';
import 'package:proyecto_final/ui/widgets/button_custom_widget.dart';
import 'package:proyecto_final/ui/widgets/general_widgets.dart';
import 'package:proyecto_final/ui/widgets/textfield_normal_widget.dart';
import 'package:proyecto_final/ui/widgets/textfield_password_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  divider30(),
                  SvgPicture.asset(
                    'assets/images/login.svg',
                    height: 180.0,
                  ),
                  divider30(),
                  Text(
                    "Iniciar sesión",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  divider10(),
                  TextFieldNormalWidget(
                    hintText: "Correo electrónico",
                    icon: Icons.email,
                    controller: _emailController,
                  ),
                  divider20(),
                  TextFieldPasswordWidget(
                    controller: _passwordController,
                  ),
                  divider20(),
                  ButtonCustomWidget(
                    text: "Iniciar sesión",
                    color: kBrandPrimaryColor,
                    icon: "check",
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                  ),
                  divider20()
                ],
              )),
        ));
  }
}
