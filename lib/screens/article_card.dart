import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ArticleCard extends StatefulWidget {
  final String title;
  final String img;
  final List article;
  final String dateCreated;
  final String description;

  const ArticleCard({required this.title, required this.img, required this.article, required this.dateCreated, required this.description, super.key});

  @override
  State<ArticleCard> createState() => _ArticleCardState();
}

class _ArticleCardState extends State<ArticleCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 500,
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
            ),
            SizedBox(height: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        widget.title, 
                        style: GoogleFonts.poppins(
                          fontSize: 13, 
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        widget.description, 
                        softWrap: false,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontSize: 12, 
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.dateCreated,
                        style: TextStyle(
                          color: Color(0xAA939393),
                          fontSize: 12,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          overlayColor: Colors.transparent,
                          minimumSize: Size(0, 0),  
                        ),
                        onPressed: () {}, 
                        child: Text(
                          "Read more", 
                          style: GoogleFonts.poppins(
                            fontSize: 12, 
                            color: Colors.black,
                            decoration: TextDecoration.underline
                          )
                        ),
                      )
                    ]
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}