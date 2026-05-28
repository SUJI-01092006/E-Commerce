import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_page.dart';

class EcommercePage
    extends StatefulWidget {

  const EcommercePage({
    super.key,
  });

  @override
  State<EcommercePage>
  createState() =>
      _EcommercePageState();
}

class _EcommercePageState
    extends State<EcommercePage> {

  String username =
      "";

  List products = [

    {
      "name": "Laptop",
      "price": "₹55,000",
      "image":
      "https://images.unsplash.com/photo-1496181133206-80ce9b88a853",
    },

    {
      "name": "Headphones",
      "price": "₹2,499",
      "image":
      "https://images.unsplash.com/photo-1505740420928-5e560c06d30e",
    },

    {
      "name": "Shoes",
      "price": "₹1,999",
      "image":
      "https://images.unsplash.com/photo-1542291026-7eec264c27ff",
    },
  ];

  @override
  void initState() {

    super.initState();

    loadUser();
  }

  loadUser() async {

    SharedPreferences sp =
    await SharedPreferences
        .getInstance();

    username =
        sp.getString(
          "username",
        ) ??
            "";

    setState(() {});
  }

  logout() {

    showDialog(

      context:
      context,

      builder:
          (_) =>
          AlertDialog(

            title:
            const Text(
              "Logout",
            ),

            content:
            const Text(
              "Do you want to logout?",
            ),

            actions: [

              ElevatedButton(

                style:
                ElevatedButton.styleFrom(
                  backgroundColor:
                  Colors.black,
                ),

                onPressed:
                    () {

                  Navigator.pop(
                      context);
                },

                child:
                const Text(
                  "Cancel",
                ),
              ),

              ElevatedButton(

                onPressed:
                    () {

                  Navigator.pushAndRemoveUntil(

                    context,

                    MaterialPageRoute(

                      builder:
                          (_) =>
                      const LoginPage(),
                    ),

                        (route) =>
                    false,
                  );
                },

                child:
                const Text(
                  "Logout",
                ),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(
      BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        centerTitle:
        true,

        title:
        Text(
          username,
        ),

        actions: [

          IconButton(

            onPressed:
            logout,

            icon:
            const Icon(
              Icons.logout,
            ),
          )
        ],
      ),

      body: ListView.builder(

        padding:
        const EdgeInsets.all(
            15),

        itemCount:
        products.length,

        itemBuilder:
            (context, index) {

          return Card(

            elevation: 8,

            margin:
            const EdgeInsets.only(
                bottom: 20),

            shape:
            RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(
                  20),
            ),

            child: Padding(

              padding:
              const EdgeInsets.all(
                  15),

              child: Column(

                children: [

                  ClipRRect(

                    borderRadius:
                    BorderRadius
                        .circular(
                        15),

                    child:
                    Image.network(

                      products[index]
                      ["image"],

                      height: 200,

                      width:
                      double.infinity,

                      fit:
                      BoxFit.cover,
                    ),
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  Text(

                    products[index]
                    ["name"],

                    style:
                    const TextStyle(

                      fontSize: 24,

                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  Text(

                    products[index]
                    ["price"],

                    style:
                    const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}