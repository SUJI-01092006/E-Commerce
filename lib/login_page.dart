
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bot_toast/bot_toast.dart';

import 'register_page.dart';
import 'ecommerce_page.dart';

class LoginPage extends StatefulWidget {
const LoginPage({super.key});

@override
State<LoginPage> createState() =>
_LoginPageState();
}

class _LoginPageState
extends State<LoginPage> {

final formKey =
GlobalKey<FormState>();

final username =
TextEditingController();

final password =
TextEditingController();

bool validatePassword(
String value) {

RegExp reg = RegExp(
r'^(?=.*[0-9])(?=.*[!@#$%^&*]).+$',
);

return reg.hasMatch(value);
}

login() async {

if (formKey.currentState!
    .validate()) {

SharedPreferences sp =
await SharedPreferences
    .getInstance();

await sp.setString(
"username",
username.text,
);

BotToast.showText(

text:
"Login Successful",

duration:
const Duration(
seconds: 2),
);

Future.delayed(

const Duration(
seconds: 2),

() {

Navigator.pushReplacement(

context,

MaterialPageRoute(

builder:
(_) =>
const EcommercePage(),
),
);
},
);
}
}

@override
Widget build(BuildContext context) {

return Scaffold(

backgroundColor:
Colors.grey.shade200,

body: Center(

child:
SingleChildScrollView(

child: Card(

elevation: 10,

margin:
const EdgeInsets.all(
20),

shape:
RoundedRectangleBorder(
borderRadius:
BorderRadius.circular(
20),
),

child: Padding(

padding:
const EdgeInsets.all(
25),

child: Form(

key:
formKey,

child: Column(

mainAxisSize:
MainAxisSize.min,

children: [

Image.network(
"https://cdn-icons-png.flaticon.com/512/5087/5087579.png",
width: 120,
),

const SizedBox(
height: 20,
),

const Text(

"Login",

style: TextStyle(
fontSize: 28,
fontWeight:
FontWeight.bold,
),
),

const SizedBox(
height: 30,
),

TextFormField(

controller:
username,

decoration:
InputDecoration(

prefixIcon:
const Icon(
Icons.person,
),

labelText:
"Username",

border:
OutlineInputBorder(
borderRadius:
BorderRadius.circular(
15),
),
),

validator:
(value) {

if (value!
    .isEmpty) {

return "Enter username";
}

return null;
},
),

const SizedBox(
height: 20,
),

TextFormField(

controller:
password,

obscureText:
true,

decoration:
InputDecoration(

prefixIcon:
const Icon(
Icons.lock,
),

labelText:
"Password",

border:
OutlineInputBorder(
borderRadius:
BorderRadius.circular(
15),
),
),

validator:
(value) {

if (value!
    .isEmpty) {

return "Enter password";
}

if (!validatePassword(
value)) {

return "Password must contain number & special character";
}

return null;
},
),

const SizedBox(
height: 30,
),

SizedBox(

width:
double.infinity,

height: 50,

child:
ElevatedButton(

onPressed:
login,

child:
const Text(
"LOGIN",
),
),
),

const SizedBox(
height: 10,
),

Row(

mainAxisAlignment:
MainAxisAlignment.center,

children: [

const Text(
"Create Account?",
),

TextButton(

onPressed:
() {

Navigator.push(

context,

MaterialPageRoute(

builder:
(_) =>
const RegisterPage(),
),
);
},

child:
const Text(
"Register Here",
),
),
],
)
],
),
),
),
),
),
),
);
}
}
