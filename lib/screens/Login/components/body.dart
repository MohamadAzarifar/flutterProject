import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/common_widget.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_auth/model/request/user_param.dart';
import 'package:flutter_auth/provider/auth_provider.dart';
import 'package:flutter_auth/screens/Home/home_screen.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with CommonWidgets {
  TextEditingController _txtEmailController = TextEditingController();
  TextEditingController _txtPasswordController = TextEditingController();
  bool _isLogging = false;

  @override
  void initState() {
    _txtEmailController.text = 'Shanna@melissa.tv';
    _txtPasswordController.text = '90566-7771';
    super.initState();
  }

  @override
  void dispose() {
    _txtEmailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Login',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            Hero(
              tag: 'key1232',
              child: SvgPicture.asset(
                "assets/icons/login.svg",
                height: size.height * 0.35,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              controller: _txtEmailController,
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              controller: _txtPasswordController,
              onChanged: (value) {},
            ),
            _isLogging
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : RoundedButton(
                    text: "LOGIN",
                    press: () {
                      _validateInputs(
                        context,
                        email: _txtEmailController.text,
                        password: _txtPasswordController.text,
                      );
                    },
                  ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.pushNamed(context, SignUpScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }

  _validateInputs(BuildContext context,{String email, String password}) {
    if (email.isNotEmpty && password.isNotEmpty) {
      _login(context,email: email, password: password);
    } else {
      debugPrint('all is empty');
    }
  }

  _login(BuildContext context,{@required String email, @required String password}) async {
    final params = UserParam(email: email, password: password);
    // try {
    //   final result = await Network().login(param: params);
    //   //...
    // } catch(e) {
    //
    // } finally {
    //
    // }
    setState(() => _isLogging = true);
    Network()
        .login(param: params)
        .then((value) {
          debugPrint('network done');
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return HomeScreen();
          }));
    })
        .catchError((error) {
          debugPrint('network error $error');
          showAlert(context, body: 'error $error', title: 'Result');
    })
        .whenComplete(() {
          setState(() => _isLogging = false);
    });
  }
}
