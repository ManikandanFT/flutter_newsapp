import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import '../newscontroller/newscontroller.dart';
import '../colors/colors.dart';

class ArticleDetailsPage extends StatelessWidget {
  final String imageUrl;
  final String content;
  final String description;
  final String time;
  final String Catagory;
  final String author;
  final String title;

  const ArticleDetailsPage({
    required this.imageUrl,
    required this.content,
    required this.description,
    required this.time,
    required this.Catagory,
    required this.author,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final formattedTime = DateFormat('EEE, MMM d, y').format(DateTime.parse(time));
    List image = [
      "lib/Icons/img.png",
      "lib/Icons/img_1.png",
      "lib/Icons/img_2.png",
      "lib/Icons/img_3.png",
    ];
    List imagevale = ["  1.2K", "  766", "  236", "  32"];
    int selected = 1;

    return Scaffold(
      backgroundColor: Whitecolor,
      appBar: AppBar(
        title: Center(
          child: Text(
            "Happy Reading",
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              color: bgDarkcolor,
              fontSize: 18,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey.withOpacity(0.1),
              child: Transform.scale(
                scale: 1,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_horiz_rounded, color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    imageUrl,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.only(top: 3, bottom: 3, right: 10, left: 10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(1),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      Catagory,
                      style: const TextStyle(
                        color: greencolor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: bgDarkcolor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 16,
                        backgroundImage: NetworkImage(
                          'https://i.pinimg.com/736x/ba/d7/86/bad786dfe4f227555be6fa2484b0b9a3.jpg',
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          author + " • ",
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          formattedTime,
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: bgDarkcolor,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10,),
                  Text(
                    description,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500,
                      color: bgDarkcolor,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    content,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500,
                      color: bgDarkcolor,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 35,),
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          color: Colors.white.withOpacity(0.3),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                for (int i = 0; i < image.length; i++)
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: Colors.grey.withOpacity(0.1),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            child: Image.asset(
                                              image[i],
                                            ),
                                          ),
                                          Text(imagevale[i]),
                                        ],
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
