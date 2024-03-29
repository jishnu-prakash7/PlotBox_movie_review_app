import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:plotbox/model/user.dart';
import 'package:plotbox/screens/movie/home_screen/screen.dart';
import 'package:plotbox/screens/user/user_profile_edit_screen.dart';
import 'package:plotbox/widgets/main_refactoring.dart';
import 'package:plotbox/widgets/user_profile_ref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfileScreen extends StatefulWidget {
  final User? user;

  const UserProfileScreen({super.key, this.user});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  late Box userBox;
  User? loggedInUser;
  late int index;

  @override
  void initState() {
    super.initState();
    getuser();
    userBox = Hive.box('user');
  }

  getuser() async {
    final sharedprefs = await SharedPreferences.getInstance();
    final loggedInUserIndex = sharedprefs.getInt('loggedInUserIndexKey');
    final user = userBox.getAt(loggedInUserIndex!) as User;
    setState(() { 
      loggedInUser = user;
      index = loggedInUserIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Colors.black,
          title: appbarHeading('Profile', 25),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return const HomeScreen();
                }));
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Color.fromARGB(255, 179, 178, 178),
              )),
        ),
      ),
      body: SingleChildScrollView(
        child: ValueListenableBuilder(
          valueListenable: userBox.listenable(),
          builder: (context, box, child) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: loggedInUser?.image != null
                        ? FileImage(File(loggedInUser!.image!))
                        : const AssetImage('assets/images/avator_profile.jpeg')
                            as ImageProvider,
                    maxRadius: 60,
                  ),
                ),
                listTile(loggedInUser?.userName ?? 'value'),
                const Divider(
                  color: Color.fromARGB(255, 94, 93, 93),
                  thickness: .5,
                ),
                listTile(loggedInUser?.email ?? 'value'),
                const Divider(
                  color: Color.fromARGB(255, 94, 93, 93),
                  thickness: .5,
                ),
                listTile('Edit Profile',
                    iconbutton: IconButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) {
                            return UserProfileEdit(
                              userdetails: loggedInUser,
                              index: index,
                            );
                          }));
                        },
                        icon: const Icon(
                          Icons.edit_document,
                          color: Colors.teal,
                        ))),
                const Divider(
                  color: Color.fromARGB(255, 94, 93, 93),
                  thickness: .5,
                ),
                listTile('Logout',
                    textcolor: Colors.red,
                    iconbutton: IconButton(
                        onPressed: () {
                          logoutAlertDialog(context, signout);
                        },
                        icon: const Icon(
                          Icons.logout,
                          color: Colors.red,
                        )))
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
