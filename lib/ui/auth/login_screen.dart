import 'package:admin_panel/bloc/authentication/bloc.dart';
import 'package:admin_panel/mvvvm/login_view_modle.dart';
import 'package:admin_panel/resources/models/login_request.dart';
import 'package:admin_panel/style/MyCard.dart';
import 'package:admin_panel/style/ScreenMedia.dart';
import 'package:admin_panel/ui/widgets/button_with_icon.dart';
import 'package:admin_panel/utils/colors.dart';
import 'package:admin_panel/utils/constants.dart';
import 'package:admin_panel/utils/dialogs.dart';
import 'package:admin_panel/utils/validation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final LoginController _loginController = LoginController();
  late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => _loginController,
        child: Consumer<LoginController>(
          builder: (context, model, child) {
            if (model.errorMessage.isNotEmpty) {
              showErrorToast(model.errorMessage);
            } else if (model.user != null) {
              BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
            }
            return Scaffold(
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
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                ?.copyWith(fontSize: bigFont),
                          ),
                        ),
                        Center(
                          child: SizedBox(
                            width: ScreenMedia.isMobile(context)
                                ? double.infinity
                                : 500,
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
                                        const SizedBox(
                                          height: defaultPadding,
                                        ),
                                        TextFormField(
                                          controller: _emailController,
                                          keyboardType:
                                              TextInputType.emailAddress,
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
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            labelText: tr('email'),
                                          ),
                                          validator: (value) =>
                                              isValidEmail(value!)
                                                  ? null
                                                  : tr('invalid_email'),
                                        ),
                                        const SizedBox(height: defaultPadding),
                                        TextFormField(
                                          controller: _passwordController,
                                          obscureText: true,
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          textInputAction: TextInputAction.done,
                                          decoration: InputDecoration(
                                            prefixIcon: const Icon(
                                              Icons.lock,
                                              color: primaryColor,
                                            ),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            labelText: tr('password'),
                                          ),
                                          validator: (value) =>
                                              isValidPassword(value!)
                                                  ? null
                                                  : tr('invalid_password'),
                                        ),
                                        const SizedBox(height: smallPadding),
                                        Align(
                                            alignment:
                                                tr('current_language') == "ar"
                                                    ? Alignment.centerRight
                                                    : Alignment.centerLeft,
                                            child: TextButton(
                                              child:
                                                  Text(tr('forget_passwords')),
                                              onPressed: () {},
                                            )),
                                        const SizedBox(height: smallPadding),
                                        ButtonWithIcon(
                                          title: tr("login"),
                                          color: Colors.greenAccent,
                                          onClock: onFormSubmitted,
                                          iconData: Icons.login,
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
          },
        ));
  }

  onFormSubmitted() {
    if (_formKey.currentState!.validate()) {
      _loginController.login(LoginRequest(
          email: _emailController.text.trim(),
          userPassword: _passwordController.text));
    }
  }
}
