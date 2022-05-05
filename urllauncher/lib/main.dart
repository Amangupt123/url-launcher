import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void _showurl() {
    _launch('https://www.youtube.com/watch?v=T0qbFgbFhg0');
  }

  void _showEmail() {
    _launch('mailto:bcairns@voidrealms.com');
  }

  void _showTelephone() {
    _launch('tel:999-999-9999');
  }

  void _showSms() {
    _launch('sms:999-999-9999');
  }

  void _launch(String urlString) async {
    if (await canLaunchUrl(Uri.parse(urlString))) {
      await launchUrl(Uri.parse(urlString));
    } else {
      'could not launch url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Url"),
        ),
        body: Container(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _showurl,
                  child: Text("URL"),
                ),
                ElevatedButton(
                  onPressed: _showEmail,
                  child: Text("Email"),
                ),
                ElevatedButton(
                  onPressed: _showTelephone,
                  child: Text("Telephone"),
                ),
                ElevatedButton(
                  onPressed: _showSms,
                  child: Text("Sms"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
