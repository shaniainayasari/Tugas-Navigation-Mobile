import 'package:flutter/material.dart';

import 'home_page.dart';

class EditPage extends StatelessWidget {

  final String username;
  final String namaLengkap;
  final String email;
  final String handphone;

  const EditPage(
      {Key? key,
        required this.username,
        this.namaLengkap = "",
        this.email = "",
        this.handphone = "",
      }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String inputNama = username;
    String inputEmail = email;
    String inputHandphone = handphone;
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Edit Personal Biodata", style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            _formInput(nilaiAwal: namaLengkap, label: "Nama Lengkap", setStateInput: (value){
              if(value != ""){
                inputNama= value;
              }
              // else inputNama = value;
            }),
            SizedBox(height: 20),
            _formInput(nilaiAwal: email, label: "Email", setStateInput: (value){
              if(value != ""){
                inputEmail = value;
              }
              // else inputEmail = value;
            }),
            SizedBox(height: 20),
            _formInput(nilaiAwal: handphone, label: "No. Handphone", setStateInput: (value){
              if(value != ""){
                inputHandphone = value;
              }
              // else inputHandphone = value;
            }),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Back'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 18,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                      return HomePage(
                          username: username,
                          namaLengkap: inputNama,
                          email: inputEmail,
                          handphone: inputHandphone);
                    }));
                  },
                  child: Text("Submit"),
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
        )
      )
    );
  }
}

Widget _formInput(
    {required String nilaiAwal,
      required String label,
      required Function(String value) setStateInput})
    {
  return TextFormField(
    enabled: true,
    initialValue: nilaiAwal,
    decoration: InputDecoration(
      labelText: label,
      contentPadding: const EdgeInsets.all(12.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(color: Colors.blueGrey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(color: Colors.blueGrey),
      ),
    ),
    onChanged: setStateInput,
  );
}
