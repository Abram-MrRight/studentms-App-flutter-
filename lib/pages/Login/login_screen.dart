import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fzregex/utils/fzregex.dart';
import 'package:fzregex/utils/pattern.dart';
import 'package:get/get.dart';
import '../../Routes/app_pages.dart';
import '../Register/register_screen.dart';
import '../splashScreen/BouncingButton.dart';
import 'forgot_password.dart';
import 'login_controller.dart';

class LoginScreen extends StatefulWidget {
  final String title;

  const LoginScreen({required this.title, Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  late double width;
  late Animation<double> animation, delayedAnimation, muchDelayedAnimation, leftCurve;
  late AnimationController animationController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final LoginController loginController = Get.put(LoginController(apiRepository: Get.find()));

  bool _autoValidate = false;
  bool _showPassword = false;
  late String _password;
  late String _email;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    animation = Tween<double>(begin: -1, end: 0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeIn),
    );

    delayedAnimation = Tween<double>(begin: -1, end: 0).animate(
      CurvedAnimation(parent: animationController, curve: Interval(0.5, 1.0, curve: Curves.easeIn)),
    );

    muchDelayedAnimation = Tween<double>(begin: -1, end: 0).animate(
      CurvedAnimation(parent: animationController, curve: Interval(0.8, 1.0, curve: Curves.easeIn)),
    );

    leftCurve = Tween<double>(begin: -1, end: 0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _validateInputs() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      loginController.loginUser(_email, _password);
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          body: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Transform(
                  transform: Matrix4.translationValues(
                    animation.value * width, 0.0, 0.0,
                  ),
                  child: Center(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          child: Text(
                            'Hello',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(30.0, 35.0, 0, 0),
                          child: Text(
                            'There',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(135.0, 0.0, 0, 30),
                          child: Container(
                            child: Text(
                              '.',
                              style: TextStyle(
                                color: Colors.green[400],
                                fontSize: 80.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 10, 30, 10),
                child: Transform(
                  transform: Matrix4.translationValues(leftCurve.value * width, 0, 0),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Form(
                          key: _formKey,
                          autovalidateMode: _autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
                          child: Column(
                            children: [
                              TextFormField(
                                validator: (value) {
                                  if ((Fzregex.hasMatch(value!, FzPattern.email) == false)) {
                                    return "Enter Valid Email address";
                                  } else {
                                    return null;
                                  }
                                },
                                onSaved: (value) {
                                  _email = value!;
                                },
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  labelText: 'EMAIL',
                                  contentPadding: EdgeInsets.all(5),
                                  labelStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.grey),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.0),
                              TextFormField(
                                obscuringCharacter: '*',
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Enter Valid password";
                                  } else {
                                    return null;
                                  }
                                },
                                onSaved: (val) {
                                  _password = val!;
                                },
                                decoration: InputDecoration(
                                  suffix: _showPassword == false
                                      ? IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _showPassword = true;
                                      });
                                    },
                                    icon: Icon(Icons.lock_open),
                                  )
                                      : IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _showPassword = false;
                                      });
                                    },
                                    icon: Icon(Icons.lock),
                                  ),
                                  labelText: 'PASSWORD',
                                  contentPadding: EdgeInsets.all(5),
                                  labelStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.grey),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.green)),
                                ),
                                obscureText: !_showPassword,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 10, 30, 10),
                child: Transform(
                  transform: Matrix4.translationValues(delayedAnimation.value * width, 0, 0),
                  child: Container(
                    alignment: Alignment(1.0, 0),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, right: 20.0),
                      child: Bouncing(
                        onPress: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (BuildContext context) => ForgetPassword(),
                          //   ),
                          // );
                        },
                        child: Text(
                          "Forgot password?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),

              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 5, 20.0, 5),
                child: Transform(
                  transform: Matrix4.translationValues(muchDelayedAnimation.value * width, 0, 0),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        MaterialButton(
                          onPressed: () {
                            _validateInputs(); // Call the input validation function
                          },
                          elevation: 5.0,
                          minWidth: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 15.0), // Add padding
                          color: Colors.green,
                          shape: RoundedRectangleBorder( // Add rounded corners
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Obx(() {
                            return loginController.isLoading.value
                                ? CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            )
                                : Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                                fontSize: 16, // Adjust text size if needed
                              ),
                            );
                          }),
                        ),
                        SizedBox(height: 15.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'New here?',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(width: 5.0),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.REGISTER);
                              },
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
