import 'package:connection/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ConnectionController connectionController = Get.put(
    ConnectionController(),
  );
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomeScreen(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class HomeScreen extends StatelessWidget {
  final ConnectionController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Internet Checker")),
      body: Obx(
        () => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              controller.isConnected.value
                  ? _buildText("Connected to the Internet", Colors.green)
                  : Column(
                    children: [
                      _buildText("No Internet Connection", Colors.red),

                      _buildText(
                        "ទូរសព្ទ័អស់លុយហើយ bro ទុកលុយអ៊ុតសេរ៉ូមមែន 😹😹",
                        Colors.red,
                      ),
                    ],
                  ),
            ],
          ),
        ),
      ),
    );
  }

  _buildText(String text, Color color) => Text(
    text,
    style: TextStyle(fontSize: 17, color: color, fontWeight: FontWeight.bold),
  );
}
