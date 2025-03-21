import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_app/screens/article_card.dart';

class Article extends StatefulWidget {
  const Article({super.key});

  @override
  State<Article> createState() => _ArticleState();
}

class _ArticleState extends State<Article> {

  List _items = [];

  Future <void> getItems() async{
    final String res = await rootBundle.loadString('/json_file/sample.json');
    final item = await jsonDecode(res);
    setState(() {
      _items = item;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XAAFDFDFD),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.arrow_back_ios, size: 20),
                style: IconButton.styleFrom(overlayColor: Colors.transparent),
              ),
              SizedBox(height: 27),
              Text(
                "Don't miss out the latest news.",
                style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              Text(
                "Learn more, gain knowledge!",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff898989),
                ),
              ),
              SizedBox(height: 40),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 23,
                  crossAxisSpacing: 23,
                  childAspectRatio: 0.75
                ),
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return ArticleCard(
                    title: _items[index]["title"], 
                    img: _items[index]["img"], 
                    article: _items[index]["article"],
                    dateCreated: _items[index]["dateCreated"],
                    description: _items[index]["description"]
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}