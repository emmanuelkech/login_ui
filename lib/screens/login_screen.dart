import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:login_ui/screens/home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isVisible = false;
  bool _isObscure = true;

  fetchCredentials() {
    var username = 'username';
    var password = 'password123';
    return [username, password];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 60.0,
            width: 200.0,
          ),

          //Login text Widget
          Center(
            child: Container(
              height: 200.0,
              width: 400.0,
              alignment: Alignment.center,
              child: const Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 60,
            width: 10,
          ),

          //Wrong password text
          Visibility(
            visible: _isVisible,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(10),
              child: Text(
                'Wrong credentials entered',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 10,
                ),
              ),
            ),
          ),

          //Text fields for username and password
          Container(
            height: 140.0,
            width: 530.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Colors.white,
            ),
            child: Column(
              children: [
                TextFormField(
                  onTap: () {
                    setState(() {
                      _isVisible = false;
                    });
                  },
                  controller: usernameController, //controller for username
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Username',
                    contentPadding: EdgeInsets.all(20),
                  ),
                  onEditingComplete: () {
                    FocusScope.of(context).nextFocus();
                  },
                ),
                Divider(
                  thickness: 3,
                ),
                TextFormField(
                  onTap: () {
                    setState(() {
                      _isVisible = false;
                    });
                  },
                  controller: passwordController, //controller for password
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Password',
                    contentPadding: EdgeInsets.all(20),
                    //Adding the visibility icon to toggle visibility of the password field
                    suffixIcon: IconButton(
                      icon: Icon(
                          _isObscure ? Icons.visibility_off : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                  ),
                  obscureText: _isObscure,
                ),
              ],
            ),
          ),

          //Submit Button
          Container(
            width: 570.0,
            height: 70.0,
            padding: EdgeInsets.only(top: 20.0),
            child: RaisedButton(
              color: Colors.pink,
              child: Text(
                'Submit',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              onPressed: () {
                  if (usernameController.text == fetchCredentials()[0] &&
                      passwordController.text == fetchCredentials()[1]) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                      (Route<dynamic> route) => false,
                    );
                  } else {
                    setState(() {
                      _isVisible = true;
                    });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
