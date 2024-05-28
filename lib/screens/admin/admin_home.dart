import 'package:ecommerce/main.dart';
import 'package:ecommerce/screens/admin/add_products.dart';
import 'package:flutter/material.dart';

import 'package:transparent_image/transparent_image.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Admin Panel",
          style: TextStyle(
            color: style.color1,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: style.color1,
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            style.customSpacing(height: 10.0),
            // admin image and name
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: .07,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  FadeInImage(
                    placeholder: MemoryImage(kTransparentImage),
                    image: AssetImage("assets/images/user2.png"),
                    height: 150,
                    fit: BoxFit.contain,
                  ),
                  Divider(
                    color: Colors.white,
                    thickness: .05,
                  ),
                  Center(
                    child: Text(
                      "JayTheThird",
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.5,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            style.customSpacing(height: 15.0),
            //
            ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.white,
                  width: .07,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              title: Text(
                "Add Product's",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  letterSpacing: 1.5,
                  fontSize: 18,
                ),
              ),
              trailing: GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => AddProducts(),
                  ),
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
