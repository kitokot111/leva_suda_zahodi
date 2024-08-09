import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Registration',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: _registrationBody(),
      ),
    );
  }
}

class _registrationBody extends StatefulWidget {
  const _registrationBody({super.key});

  @override
  State<_registrationBody> createState() => _registrationBodyState();
}
final _formKey = GlobalKey<FormState>();
bool _hidePass = true;
final _nameController = TextEditingController();
final _phoneController = TextEditingController();
final _emailController = TextEditingController();
final _storyController = TextEditingController();
final _passController = TextEditingController();
final _confirmPassController = TextEditingController();

@override
void dispose() {
  _nameController.dispose();
  _phoneController.dispose();
  _emailController.dispose();
  _storyController.dispose();
  _passController.dispose();
  _confirmPassController.dispose();
}

class _registrationBodyState extends State<_registrationBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Full Name *',
                hintText: 'How people call you?',
                prefixIcon: Icon(
                  Icons.person,
                ),
                suffixIcon: Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  borderSide: BorderSide(
                    color: Colors.yellow,
                    width: 2.0,
                  ),
                ),
              ),
                validator: _validateName,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.call,
                ),
                suffixIcon: Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                ),
                hintText: 'What your phone number?',
                labelText: 'Phone Number *',
                helperText: 'Phone number format: (XXX)XXX-XXXX',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  borderSide: BorderSide(
                    color: Colors.yellow,
                    width: 2.0,
                  ),
                ),
              ),
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email Adress',
                icon: Icon(
                  Icons.mail,
                ),
                hintText: 'Write your email adress',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _storyController,
              decoration: InputDecoration(
                labelText: 'Life Story',
                icon: Icon(
                  Icons.nightlife,
                ),
                hintText: 'Something about you',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _passController,
              maxLength: 8,
              obscureText: _hidePass,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.security,
                ),
                labelText: 'Password *',
                hintText: 'Enter your password',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _hidePass = !_hidePass;
                    });
                  },
                  icon: Icon(
                    _hidePass ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _confirmPassController,
              maxLength: 8,
              obscureText: _hidePass,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.border_color,
                ),
                labelText: 'Confirm Password *',
                hintText: 'Confirm your password',
              ),
            ),
            SizedBox(
              height: 15,
            ),
            MaterialButton(
              onPressed:_submitForm,
              child: Text(
                'Submit Form',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
  void _submitForm() {
    print('''Name: ${_nameController.text} 
Phone: ${_phoneController.text} 
Email: ${_emailController.text} 
Life story: ${_storyController.text} 
Password: ${_passController.text}
Confirm password ${_confirmPassController.text}
   ''');
  }
}

String? _validateName(String? value) {
  final _nameExp = RegExp(r'^[A-Za-z ]+$');
  if (value == null) {
    return 'Name is reqired.';
  } else if (!_nameExp.hasMatch(value)) {
    return 'Please enter alphabetical characters.';
  } else {
    return null;
  }
}