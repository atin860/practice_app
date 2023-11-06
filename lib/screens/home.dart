import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_app/controller/controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MainController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Hello"),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  controller.logout();
                },
                child: Text("Log out"))
          ],
        ));
  }
}
