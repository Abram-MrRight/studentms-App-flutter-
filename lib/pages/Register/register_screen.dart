import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentms_app/Routes/app_pages.dart';
import 'package:studentms_app/pages/Register/register_controller.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with SingleTickerProviderStateMixin {
  late Animation animation, delayedAnimation, muchDelayedAnimation, LeftCurve;
  late AnimationController animationController;
  late String username = "", email = "", password = "", confirmPassword = "";
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final RegisterController controller = Get.put(RegisterController(apiRepository: Get.find()));

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(duration: Duration(seconds: 3), vsync: this);
    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    delayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn)));

    muchDelayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.8, 1.0, curve: Curves.fastOutSlowIn)));

    LeftCurve = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 1.0, curve: Curves.easeInOut)));

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          body: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 70.0),
                child: Transform(
                  transform: Matrix4.translationValues(animation.value * width, 0.0, 0.0),
                  child: Center(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          child: Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(28.0, 0.0), // Adjust the x-offset to slide right
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(30.0, 60.0, 0, 0),
                            child: Text(
                              'Now',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(135.0, 20.0, 0, 20),
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
                  transform: Matrix4.translationValues(LeftCurve.value * width, 0, 0),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Form(
                            key: _formkey,
                            child: Column(
                              children: [
                                SizedBox(height: 20.0),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'You must enter your username!';
                                    } else {
                                      return null;
                                    }
                                  },
                                  onChanged: (val) {
                                    setState(() {
                                      username = val;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Username',
                                    contentPadding: EdgeInsets.all(5),
                                    labelStyle: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Colors.grey
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.green)
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'You must enter your email!';
                                    } else {
                                      return null;
                                    }
                                  },
                                  onChanged: (val) {
                                    setState(() {
                                      email = val;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    contentPadding: EdgeInsets.all(5),
                                    labelStyle: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Colors.grey
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.green)
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter your password';
                                    } else if (value.length < 6) {
                                      return 'Password should be at least 6 characters';
                                    } else {
                                      return null;
                                    }
                                  },
                                  onChanged: (val) {
                                    setState(() {
                                      password = val;
                                    });
                                  },
                                  obscureText: _obscurePassword,
                                  decoration: InputDecoration(
                                      labelText: 'Password',
                                      contentPadding: EdgeInsets.all(5),
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.grey
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.green)
                                      ),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _obscurePassword ? Icons.visibility : Icons.visibility_off,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _obscurePassword = !_obscurePassword;
                                          });
                                        },
                                      )
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Confirm your password';
                                    } else if (value != password) {
                                      return 'Passwords do not match';
                                    } else {
                                      return null;
                                    }
                                  },
                                  onChanged: (val) {
                                    setState(() {
                                      confirmPassword = val;
                                    });
                                  },
                                  obscureText: _obscureConfirmPassword,
                                  decoration: InputDecoration(
                                      labelText: 'Confirm Password',
                                      contentPadding: EdgeInsets.all(5),
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.grey
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.green)
                                      ),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _obscureConfirmPassword ? Icons.visibility : Icons.visibility_off,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _obscureConfirmPassword = !_obscureConfirmPassword;
                                          });
                                        },
                                      )
                                  ),
                                ),
                              ],
                            )
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          height: 40,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.greenAccent,
                            color: Colors.green,
                            elevation: 7.0,
                            child: InkWell(
                              onTap: () async {
                                if (_formkey.currentState!.validate()) {
                                  _formkey.currentState!.save();
                                  bool result = await controller.registerUser(username, email, password, confirmPassword);
                                  if (result) {
                                    Get.offAllNamed(Routes.LOGIN);
                                  }
                                }
                              },
                              child: Center(
                                child: Text(
                                  'REGISTER',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        RichText(
                          text: TextSpan(
                            text: 'Have an account? ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: 'login',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.toNamed(Routes.LOGIN);
                                  },
                              ),
                            ],
                          ),
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
