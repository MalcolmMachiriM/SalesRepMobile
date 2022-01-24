import 'package:fc/constants.dart';
import 'package:flutter/material.dart';
import 'package:fc/routing_constants.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final username = TextEditingController();
  final password = TextEditingController();
  var formkey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/white.jpg'),
                fit: BoxFit.cover)),
        child: Stack(
          children: [
            Positioned(
                top: 0.0,
                right: 0.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      height: 60,
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            Image.asset('assets/images/formula_chemicals.png'),
                      )),
                )),
            Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: cDefaultPadding / 2, horizontal: 8.0),
                      child: Transform.scale(
                        scale: 0.6,
                        child: Image.asset(
                          'assets/images/strike_logo.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  const Divider(color: Colors.transparent),
                  const Divider(
                    color: Colors.transparent,
                  ),
                  buildTextField('FMAdmin', 'Username', false, true, username,
                      const Icon(Icons.person)),
                  const Divider(color: Colors.transparent),
                  buildTextField('********', 'Password', true, false, password,
                      const Icon(Icons.lock)),
                  Center(
                    child: Container(
                      alignment: Alignment.center,
                      width: 2 / 3 * MediaQuery.of(context).size.width,
                      child: SizedBox(
                        width: 1 / 3 * MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                            style: TextButton.styleFrom(
                              backgroundColor: cButtonColor,
                            ),
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, RoutingConstants.bottomNav);
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildTextField(String hintText, String labelText, bool isPassword,
      bool isEmail, TextEditingController controller, Icon icon) {
    return Padding(
      padding: const EdgeInsets.only(
          bottom: 8.0, left: cDefaultPadding, right: cDefaultPadding),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(cDefaultRadius),
            border: Border.all()),
        child: TextField(
          controller: controller,
          obscureText: isPassword,
          keyboardType:
              isEmail ? TextInputType.emailAddress : TextInputType.text,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(cDefaultPadding / 2),
              hintText: hintText,
              labelText: labelText,
              prefixIcon: icon,
              border: InputBorder.none),
        ),
      ),
    );
  }
}
