import 'package:flutter/material.dart';
import 'package:nerds_project/functions/shared_pref.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  String name = 'Artify';
  String mail = 'artify@amalitech.com';

  getDetails() async {
    name = (await SharedPrefHelper().getUserName())!;
  mail = (await SharedPrefHelper().getUserEmail())!;
  }

  @override
  void initState() {
    getDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/user.png'),
                radius: 40,
              ),
            ),
            Divider(
              height: 60,
              color: Colors.grey[800],
            ),
            const Text(
              'Name',
              style: TextStyle(color: Colors.grey, letterSpacing: 2),
            ),
            const SizedBox(height: 10),
            Text(
              name,
              style: TextStyle(
                  color: Colors.deepPurpleAccent[200],
                  letterSpacing: 2,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            const Text(
              'Level',
              style: TextStyle(color: Colors.grey, letterSpacing: 2),
            ),
            const SizedBox(height: 10),
            Text(
              '8',
              style: TextStyle(
                  color: Colors.deepPurpleAccent[200],
                  letterSpacing: 2,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Row(
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: Colors.grey[400],
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  mail,
                  style: TextStyle(
                      color: Colors.grey[400], fontSize: 18, letterSpacing: 1),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Icon(Icons.list_alt_outlined, color: Colors.deepPurpleAccent[200],),
                  const SizedBox(width: 10,),
                  Text(
                    'My Orders',
                    style: TextStyle(
                        color: Colors.deepPurpleAccent[200],
                        letterSpacing: 2,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Icon(Icons.settings, color: Colors.deepPurpleAccent[200],),
                  const SizedBox(width: 10,),
                  const Text("Settings",
                      style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          letterSpacing: 2)),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, "/authtabs");
              },
              child: Row(
                children: [
                  Icon(Icons.power_settings_new_sharp, color: Colors.deepPurpleAccent[200],),
                  const SizedBox(width: 10,),
                  const Text("Log 0ut",
                      style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          letterSpacing: 2)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
