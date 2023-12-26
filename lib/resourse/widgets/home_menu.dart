import 'package:flutter/material.dart';

class HomeMenu extends StatefulWidget {
  const HomeMenu({Key? key}) : super(key: key);

  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Image.asset('assets/ic_user_24x24.png'),
          title: const Text(
            'My Profile',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        ListTile(
          leading: Image.asset('assets/ic_time_24x24.png'),
          title: const Text(
            'Ride History',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        ListTile(
          leading: Image.asset('assets/ic_percentage_24x24.png'),
          title: const Text(
            'Offers',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        ListTile(
          leading: Image.asset('assets/ic_appointment_reminders_24x24.png'),
          title: const Text(
            'Notifications',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        ListTile(
          leading: Image.asset('assets/ic_help_24x24.png'),
          title: const Text(
            'Help & Support',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        ListTile(
          leading: Image.asset('assets/ic_logout_24x24.png'),
          title: const Text(
            'Logout',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        )
      ],
    );
  }
}
