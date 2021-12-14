import 'package:admin_panel/ui/help_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:admin_panel/bloc/authentication/bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  //
  // final storage = new FlutterSecureStorage();

  // getInitailLang() async {
  //   var _lang = await storage.read(key: "lang");
  //   if (_lang != null) {
  //     return jsonDecode(_lang);
  //   } else {
  //     return null;
  //   }
  // }
  // getIfStepFirst() async {
  //   var _step = await storage.read(key: "step");
  //   if (_step != null) {
  //     return jsonDecode(_step);
  //   } else {
  //     return null;
  //   }
  // }

 late AnimationController _animationController;
 late Animation _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..repeat(reverse: true);

    _animation = Tween<Offset>(
      begin: Offset(
        0,
        1,
      ),
      end: Offset(0, 0),
    ).animate(_animationController);
    _animationController.forward().whenComplete(() {
      BlocProvider.of<AuthenticationBloc>(context).add(AppStarted());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(Icons.add_location,size: 150,),
              const SizedBox(height: paddingBig),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'schoolz',
                  style: GoogleFonts.portLligatSans(
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
