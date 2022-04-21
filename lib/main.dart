import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shayri/secondpage.dart';

void main() {
  runApp(MaterialApp(
    home: firstpage(),
  ));
}

class firstpage extends StatefulWidget {
  @override
  _firstpageState createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  List a = [
    "Dosti Shayari",
    "Festival Shayari",
    "Friendship Shayari",
    " Funny Shayari",
    "Good Morning Shayari",
    "Good Night Shayari",
    "Heart Touching Shayari",
    "Hindi Poems Poetry",
    "Hindi Shayari",
    "Life Shayari"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    forpermission();
  }

  Future<void> forpermission() async {
    var status = await Permission.storage.status;
    if (status.isDenied) {
      // We didn't ask for permission yet or the permission has been denied before but not permanently.

      await [
        Permission.storage,
      ].request();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text(
          "Shayari Application",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: a.length,
        itemBuilder: (context, index) {
          return ListTile(
            tileColor: Colors.lightBlueAccent,
            contentPadding: EdgeInsets.all(10),
            shape: Border.all(color: Colors.black),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return secondpage(a, index);
                },
              ));
            },
            trailing: Icon(Icons.arrow_right),
            leading: Image.asset(
              "images/p${index + 1}.jpg",
            ),
            title: Text(
              "${a[index]}",
              style: TextStyle(fontSize: 20),
            ),
          );
        },
      ),
    );
  }
}
