import 'package:flutter/material.dart';
import 'package:health_app/screens/article.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Article()
              )
            );
          }, 
          child: Text("Article")
        )
      )
    );
  }
}