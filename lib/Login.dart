import 'package:flutter/material.dart';
import 'home.dart';

class MyLoginScreen extends StatefulWidget {
  MyLoginScreen({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyLoginScreenState createState() => _MyLoginScreenState();
}

class _MyLoginScreenState extends State<MyLoginScreen> {
  //initially password is hidden
  bool _obscureText = true;
  bool valuefirst = false;
  TextEditingController userController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userField = TextField(
      controller: userController,
      obscureText: false,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: 'User name',
          prefixIcon: Icon(Icons.mail_outline)),
    );

    final passwordField = TextField(
        controller: passwordController,
        obscureText: _obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: 'Password',
          prefixIcon: Icon(Icons.lock_outline),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.remove_red_eye,
              color: this._obscureText ? Colors.grey : Colors.blue,
            ),
            onPressed: () {
              setState(() => this._obscureText = !this._obscureText);
            },
          ),
        ));

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: 150,
        //padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          if (userController.text == '' || passwordController.text == '') {
            showDialog(
                context: context,
                builder: (ctxt) => new AlertDialog(
                      title: Text("Empty Field!"),
                      content: Text('Username and password cannot be empty'),
                    ));
          } else {
            Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) => new Home(
                        userName: userController.text,
                      )),
            );
          }
        },
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
    );
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 155.0,
                  child: Image.asset(
                    "assets/my_icon.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 45.0),
                userField,
                SizedBox(height: 25.0),
                passwordField,
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: <Widget>[
                    Checkbox(
                      checkColor: Colors.white,
                      activeColor: Colors.blue,
                      value: this.valuefirst,
                      onChanged: (bool value) {
                        setState(() {
                          this.valuefirst = value;
                        });
                      },
                    ),
                    Text('Remember Me '),
                    SizedBox(
                      width: 90.0,
                    ),
                    Text(
                      'Forgot Password',
                      style: new TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
                SizedBox(
                  height: 35.0,
                ),
                loginButton,
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
