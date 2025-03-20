import 'package:flutter/material.dart';

class ArticleCard extends StatefulWidget {
  final String title;
  final String img;
  final List article;

  const ArticleCard({required this.title, required this.img, required this.article, super.key});

  @override
  State<ArticleCard> createState() => _ArticleCardState();
}

class _ArticleCardState extends State<ArticleCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),      
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.10),
            offset: Offset(-1, 0),
            blurRadius: 4
          ),
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.10),
            offset: Offset(1, 1),
            blurRadius: 4
          )
        ],
        color: Colors.white,
      ),
      
      child: Padding(
        padding: EdgeInsets.all(13),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(widget.img, fit: BoxFit.cover)
              ),
            )
          ],
        ),
      ),
    );
  }
}