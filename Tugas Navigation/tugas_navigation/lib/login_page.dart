import 'package:flutter/material.dart';
import 'package:tugas_navigation/register_page.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  final String username;
  final String password;
  const LoginPage(
      {Key? key,
      this.username = "",
      this.password = "",}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final inputUsername = TextEditingController();
  final inputPassword = TextEditingController();
  bool isLoginSuccess = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login"),
          automaticallyImplyLeading: false,
        ),
        body: Column(
            children: [
              _usernameField(),
              _passwordField(),
              _loginButton(context),
              _registerButton(context),
            ]),
      ),
    );
  }
  Widget _usernameField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        controller: inputUsername,
        decoration: InputDecoration(
          hintText: 'Username',
          contentPadding: EdgeInsets.all(8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.blueGrey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: (isLoginSuccess)
                ? Colors.blueGrey : Colors.red),
          ),
        ),
      ),
    );
  }
  Widget _passwordField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        obscureText: true,
        controller: inputPassword,
        decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: const EdgeInsets.all(8.0),
          border: OutlineInputBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.blueGrey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: (isLoginSuccess)
                ? Colors.blueGrey : Colors.red),
          ),
        ),
      ),
    );
  }
  Widget _loginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: (isLoginSuccess) ? Colors.blueGrey :
          Colors.red, // background
          onPrimary: Colors.white70, // foreground
        ),
        onPressed: () {
          String text = "";
          if ((inputUsername.text == widget.username && inputPassword.text == widget.password)
          || (inputUsername.text == "admin" && inputPassword.text == "admin")) {
            setState(() {
              text = "Login Success";
              isLoginSuccess = true;
            });
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
              return HomePage(username: inputUsername.text);
            }));
          } else {
            setState(() {
              text = "Login failed, check your password and username!";
              isLoginSuccess = false;
            });
          }
          print("isLoginSuccess : $isLoginSuccess");
          SnackBar snackBar = SnackBar(
            content: Text(text),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Login'),
      ),
    );
  }

  Widget _registerButton(BuildContext context){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return RegisterPage();
          }));
        }, // Respon ketika button ditekan
        child: Text("Register"),
      )
    );
  }
}