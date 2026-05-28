import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';

class RegisterPage
    extends StatefulWidget {

  const RegisterPage({
    super.key,
  });

  @override
  State<RegisterPage>
  createState() =>
      _RegisterPageState();
}

class _RegisterPageState
    extends State<RegisterPage> {

  final formKey =
  GlobalKey<FormState>();

  final name =
  TextEditingController();

  final password =
  TextEditingController();

  final confirm =
  TextEditingController();

  String gender =
      "Male";

  register() {

    if (formKey.currentState!
        .validate()) {

      BotToast.showText(
        text:
        "Registration Successful",
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(
      BuildContext context) {

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
                      "https://cdn-icons-png.flaticon.com/512/3135/3135715.png",
                      width: 120,
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    const Text(

                      "Register",

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
                      name,

                      decoration:
                      InputDecoration(

                        labelText:
                        "Name",

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

                          return "Enter name";
                        }

                        return null;
                      },
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    DropdownButtonFormField(

                      value:
                      gender,

                      decoration:
                      InputDecoration(

                        border:
                        OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(
                              15),
                        ),
                      ),

                      items: const [

                        DropdownMenuItem(
                          value:
                          "Male",
                          child:
                          Text(
                            "Male",
                          ),
                        ),

                        DropdownMenuItem(
                          value:
                          "Female",
                          child:
                          Text(
                            "Female",
                          ),
                        ),
                      ],

                      onChanged:
                          (v) {

                        setState(() {

                          gender =
                          v!;
                        });
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

                        return null;
                      },
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    TextFormField(

                      controller:
                      confirm,

                      obscureText:
                      true,

                      decoration:
                      InputDecoration(

                        labelText:
                        "Confirm Password",

                        border:
                        OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(
                              15),
                        ),
                      ),

                      validator:
                          (value) {

                        if (value !=
                            password.text) {

                          return "Password not match";
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
                        register,

                        child:
                        const Text(
                          "REGISTER",
                        ),
                      ),
                    ),
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