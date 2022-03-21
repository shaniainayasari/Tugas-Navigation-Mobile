import 'package:flutter/material.dart';

import 'edit_page.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  final String username;
  final String namaLengkap;
  final String email;
  final String handphone;
  const HomePage(
      {Key? key,
      required this.username,
      this.namaLengkap = "",
      this.email = "",
      this.handphone = "",}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        automaticallyImplyLeading: false,
      ),
      body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                "Welcome ${username} !",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              FlutterLogo(size:100),
              SizedBox(height: 20),

              Text(
                  "Detail Account Information:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

              SizedBox(height: 20),
              Text(
                "Username : ${username}",
                style: TextStyle(fontSize: 18),
              ),

              SizedBox(height: 20),
              Text(
                "Full Name : ${namaLengkap}",
                style: TextStyle(fontSize: 18),
              ),

              SizedBox(height: 20),
              Text(
                "Email : ${email}",
                style: TextStyle(fontSize: 18),
              ),

              SizedBox(height: 20),
              Text(
                "Cell Phone Number : ${handphone}",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return EditPage(username: username, namaLengkap: namaLengkap,
                            email: email, handphone: handphone);
                      }));
                    },
                    child: Text('Edit'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 18,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
                        return LoginPage();
                      }), (route) => false);
                    },
                    child: Text("Logout"),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 18,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
      ),
    );
  }
}

