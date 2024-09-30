import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:flutter_group3/profile/profile.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({super.key});

  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.red,
          foregroundColor: Colors.black,
          title: const Text('Settings'),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
            },
            icon: const Icon(Icons.arrow_back_ios_new_sharp),
          ),
        ),
        body: SafeArea(
            child: ListView(padding: EdgeInsets.all(5), children: [
          SettingsGroup(title: 'General', children: <Widget>[
            BuildManagement(),
            BuildNotification(),
            BuildPrivacy(),
            BuildSosper()
          ]),
          SettingsGroup(title: 'Support', children: <Widget>[
            BuildHelpcenter(),
            BuildTOS(),
            BuildPolicy(),
            BuildAbout()
          ]),
          SettingsGroup(title: 'Account', children: <Widget>[
            BuildAddaccount(),
            BuildResetPass(),
            BuildSecure(),
            BuildLogout()
          ]),
        ])),
      );
}

//GENERAL
Widget BuildManagement() => SimpleSettingsTile(
      title: 'Account Management',
      titleTextStyle: TextStyle(fontSize: 13),
      onTap: () {},
    );

Widget BuildNotification() => SimpleSettingsTile(
      title: 'Notification',
      titleTextStyle: TextStyle(fontSize: 13),
      onTap: () {},
    );

Widget BuildPrivacy() => SimpleSettingsTile(
      title: 'Privacy and Data',
      titleTextStyle: TextStyle(fontSize: 13),
      onTap: () {},
    );

Widget BuildSosper() => SimpleSettingsTile(
      title: 'Social Permission',
      titleTextStyle: TextStyle(fontSize: 13),
      onTap: () {},
    );

//Support
Widget BuildHelpcenter() => SimpleSettingsTile(
      title: 'Help Center',
      titleTextStyle: TextStyle(fontSize: 13),
      onTap: () {},
    );

Widget BuildTOS() => SimpleSettingsTile(
      title: 'Terms Of Service',
      titleTextStyle: TextStyle(fontSize: 13),
      onTap: () {},
    );

Widget BuildPolicy() => SimpleSettingsTile(
      title: 'Privacy Policy',
      titleTextStyle: TextStyle(fontSize: 13),
      onTap: () {},
    );

Widget BuildAbout() => SimpleSettingsTile(
      title: 'About',
      titleTextStyle: TextStyle(fontSize: 13),
      onTap: () {},
    );

//Account
Widget BuildAddaccount() => SimpleSettingsTile(
      title: 'Add Account',
      titleTextStyle: TextStyle(fontSize: 13),
      onTap: () {},
    );

Widget BuildResetPass() => SimpleSettingsTile(
      title: 'Reset Password',
      titleTextStyle: TextStyle(fontSize: 13),
      onTap: () {},
    );

Widget BuildSecure() => SimpleSettingsTile(
      title: 'Security',
      titleTextStyle: TextStyle(fontSize: 13),
      onTap: () {},
    );

Widget BuildLogout() => SimpleSettingsTile(
      title: 'Logout',
      titleTextStyle: TextStyle(fontSize: 13),
      onTap: () {},
    );
