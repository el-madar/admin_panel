import 'dart:io';

import 'package:admin_panel/style/MyCard.dart';
import 'package:admin_panel/style/ScreenMedia.dart';
import 'package:admin_panel/utils/colors.dart';
import 'package:admin_panel/utils/constants.dart';
import 'package:admin_panel/utils/validation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';



class LoginScreen extends StatefulWidget {

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    tr('login'),
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        fontSize: bigFont
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: ScreenMedia.isMobile(context) ? double.infinity : 500,
                    child: Padding(
                      padding: const EdgeInsets.all(bigPadding),
                      child: MyCard(
                        borderRadius: BorderRadius.circular(30.0),
                        child: Form(
                          key: _formKey,
                          child: Padding(
                            padding: const EdgeInsets.all(bigPadding),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(height: defaultPadding,),
                                TextFormField(
                                  controller: _emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                  // style: TextStyle(
                                  //   color: Colors.black,
                                  //   fontFamily: 'OpenSans',
                                  // ),
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.email,
                                      color: primaryColor,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    labelText: tr('email'),
                                    // labelStyle: TextStyle(
                                    //   color: Colors.black26,
                                    //   fontFamily: 'OpenSans',
                                    // ),
//            prefixIcon: const Icon(Icons.person),
                                  ),
                                  validator: (value) => isValidEmail(value!)
                                      ? null
                                      : tr('invalid_email'),
                                ),
                                const SizedBox(height: defaultPadding),
                                TextFormField(
                                  controller: _passwordController,
                                  obscureText: true,
                                  keyboardType: TextInputType.visiblePassword,
                                  textInputAction: TextInputAction.done,
                                  // style: TextStyle(
                                  //   color: Colors.black,
                                  //   fontFamily: 'OpenSans',
                                  // ),
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      color: primaryColor,
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    labelText: tr('password'),
                                    // labelStyle: TextStyle(
                                    //   color: Colors.black26,
                                    //   fontFamily: 'OpenSans',
                                    // ),
//            prefixIcon: const Icon(Icons.lock),
                                  ),
                                  validator: (value) => isValidPassword(value!)
                                      ? null
                                      : tr('invalid_password'),
                                ),
                                const SizedBox(height: smallPadding),
                                Align(
                                  alignment: tr('current_language') == "ar" ? Alignment.centerRight : Alignment.centerLeft,
                                  child: TextButton(
                                    child: Text(tr('forget_passwords')),
                                    onPressed: () {

                                    },
                                  )
                                ),
                                const SizedBox(height: smallPadding),
                                SizedBox(
                                  width: 200,
                                  child: MaterialButton(
                                    elevation: 5.0,
                                    color: accentColor,
                                    onPressed: () {
                                      onFormSubmitted();
                                    },
                                    padding: EdgeInsets.all(defaultPadding),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    child: false ? const CircularProgressIndicator() : Text(
                                      tr('login'),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: defaultPadding),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onFormSubmitted() async {

    // if (_formKey.currentState!.validate()) {
    //  await Provider.of<MyAuth>(context, listen: false)
    //       .login(
    //       LoginRequest(
    //           email:  _emailController.text.trim() ,
    //           userPassword: _passwordController.text
    //       )
    //   );
    // }
  }

}
