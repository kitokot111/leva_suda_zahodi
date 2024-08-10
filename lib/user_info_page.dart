import 'package:flutter/material.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User Info',
        ),
        centerTitle: true,
      ),
      body: Card(
        margin: EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Name',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text('Story'),
              leading: Icon(
                Icons.person,
                color: Colors.black,
              ),
              trailing: Text('Country'),
            ),
            ListTile(
              title: Text(
                'Phone number',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              leading: Icon(
                Icons.call,
                color: Colors.black,
              ),
            ),
            ListTile(
              title: Text(
                'Email',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              leading: Icon(
                Icons.mail,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
