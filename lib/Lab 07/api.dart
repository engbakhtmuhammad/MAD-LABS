import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiFetchScreen extends StatefulWidget {
  @override
  _ApiFetchScreenState createState() => _ApiFetchScreenState();
}

class _ApiFetchScreenState extends State<ApiFetchScreen> {
  String data = "Fetching...";

  void fetchData() async {
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"));
    setState(() {
      data = json.decode(response.body)['title'];
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('API Fetch App')),
      body: Center(
        child: Text(data, style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
