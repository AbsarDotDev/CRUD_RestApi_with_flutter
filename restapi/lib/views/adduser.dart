import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:restapi/models/usermodel.dart';
import 'package:restapi/services/user_service.dart';

class AdU extends StatefulWidget {
  const AdU({Key? key}) : super(key: key);

  @override
  State<AdU> createState() => _AdUState();
}

class _AdUState extends State<AdU> {
  @override
  Widget build(BuildContext context) {
    TextEditingController myname = TextEditingController();
    TextEditingController myemail = TextEditingController();

    TextEditingController myusername = TextEditingController();
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: myname,
            decoration: new InputDecoration.collapsed(hintText: 'Name'),
          ),
          TextField(
            controller: myemail,
            decoration: new InputDecoration.collapsed(hintText: 'Email'),
          ),
          TextField(
            controller: myusername,
            decoration: new InputDecoration.collapsed(hintText: 'Username'),
          ),
          ElevatedButton(
              onPressed: () {
                addUser(Data(
                    name: myname.text,
                    email: myemail.text,
                    username: myusername.text));
              },
              child: Text("Insert"))
        ],
      ),
    );
  }
}
