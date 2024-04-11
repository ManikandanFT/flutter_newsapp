
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newsapp/colors/colors.dart';
import 'package:newsapp/pages/readingpage.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../newscontroller/newscontroller.dart';

class Homebodyscreen extends StatefulWidget {
  const Homebodyscreen({Key? key});

  @override
  State<Homebodyscreen> createState() => _HomebodyscreenState();
}

class _HomebodyscreenState extends State<Homebodyscreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final NewsController newsController = Get.put(NewsController());
    return Builder(
      builder: (BuildContext context) {
        return Column(
          children: [
            Expanded(
              child: Obx(
                    () => newsController.isLoading.value
                    ? Center(child: CircularProgressIndicator())
                    : Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        final article = newsController.articles[newsController.currentPage.value];
                        Get.to(ArticleDetailsPage(
                          imageUrl: article.urlToImage,
                          content: article.content ??'',
                          description: article.description ,
                          time: article.publishedAt ,
                          Catagory: newsController.selectedCategory.value,
                          author: article.author,
                          title: article.title ?? '',
                        ));
                      },
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: screenHeight * 0.25,
                          autoPlay: true,
                          aspectRatio: 2.0,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: true,
                          autoPlayInterval: Duration(seconds: 3),
                          viewportFraction: 0.9,
                          autoPlayAnimationDuration: Duration(milliseconds: 800),
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (ind, parse) {
                            newsController.updateCurrentPage(ind);
                          },
                        ),
                        items: newsController.articles.take(5).map((article) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Stack(
                                children: [
                                  Container(
                                    height: screenHeight,
                                    width: screenWidth,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.0),
                                      color: Colors.grey,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16.0),
                                      child: Image.network(
                                        article.urlToImage,
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) {
                                          return SizedBox(
                                            height: screenHeight * 0.1,
                                            width: screenWidth * 0.2,
                                            child: Icon(Icons.error),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: screenHeight * 0.12,
                                    left: screenWidth * 0.03,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        "${newsController.selectedCategory.value}",
                                        style: const TextStyle(
                                          color: greencolor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: screenHeight * 0.15,
                                    right: screenWidth * 0.03,
                                    left: screenWidth * 0.03,
                                    child: Text(
                                      article.title,
                                      maxLines: 2,
                                      style: const TextStyle(
                                        color: Whitecolor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: screenHeight * 0.21,
                                    right: screenWidth * 0.03,
                                    left: screenWidth * 0.03,
                                    child: Row(
                                      children: [
                                        const CircleAvatar(
                                          radius: 8,
                                          backgroundImage: NetworkImage(
                                            'https://i.pinimg.com/736x/ba/d7/86/bad786dfe4f227555be6fa2484b0b9a3.jpg',
                                          ),
                                        ),
                                        SizedBox(width: screenWidth * 0.02),
                                        Text(
                                          article.author ?? 'Unknown Author',
                                          style: const TextStyle(color: Whitecolor),
                                          maxLines: 3,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: 10),
                    BuildCarouselIndicator(),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.all(screenHeight * 0.015),
                      child: Container(
                        height: screenHeight * 0.05,
                        child: Obx(() => ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            _buildCategoryButton('Hot News'),
                            SizedBox(width: screenWidth * 0.01),
                            _buildCategoryButton('Sport'),
                            SizedBox(width: screenWidth * 0.01),
                            _buildCategoryButton('Politic'),
                            SizedBox(width: screenWidth * 0.01),
                            _buildCategoryButton('Health'),
                            SizedBox(width: screenWidth * 0.01),
                            _buildCategoryButton('Entertainment'),
                            SizedBox(width: screenWidth * 0.01),
                            _buildCategoryButton('Science'),
                          ],
                        )),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),

                    Expanded(
                      child: ListView.builder(
                        itemCount: newsController.articles.length,
                        itemBuilder: (context, index) {
                          final article = newsController.articles[index];
                          final formattedTime = DateFormat('EEE, MMMM d, y').format(DateTime.parse(article.publishedAt));
                      
                          return Padding(
                            padding: EdgeInsets.all(screenHeight * 0.005),
                            child: InkWell(
                              onTap: () {
                                // Fixing the onTap function for the ListView.builder
                                final article = newsController.articles[index];
                                Get.to(ArticleDetailsPage(
                                  imageUrl: article.urlToImage,
                                  content: article.content ?? '',
                                  description: article.description ?? '',
                                  time: article.publishedAt ?? '',
                                  Catagory: newsController.selectedCategory.value,
                                  author: article.author,
                                  title: article.title ?? '',
                                ));
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.network(
                                      article.urlToImage,
                                      height: screenHeight * 0.1,
                                      width: screenWidth * 0.2,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) {
                                        return SizedBox(
                                          height: screenHeight * 0.1,
                                          width: screenWidth * 0.2,
                                          child: Icon(Icons.error),
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(width: screenWidth * 0.01),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              radius: screenHeight * 0.01,
                                              child: Image.network('https://i.pinimg.com/736x/ba/d7/86/bad786dfe4f227555be6fa2484b0b9a3.jpg'),
                                            ),
                                            SizedBox(width: screenWidth * 0.01),
                                            Text(
                                              article.author ?? 'Unknown Author',
                                              style: TextStyle(
                                                fontSize: screenHeight * 0.012,
                                                overflow: TextOverflow.ellipsis,
                                                color: Colors.black,
                                                letterSpacing: -0.2,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: screenHeight * 0.004),
                                        Text(
                                          article.description ?? '',
                                          maxLines: 2,
                                          style: TextStyle(
                                            fontSize: screenHeight * 0.016,
                                            color: Colors.black,
                                            letterSpacing: -0.2,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: screenHeight * 0.004),
                                        Row(
                                          children: [
                                            Text(
                                              "$formattedTime  •" ?? '',
                                              style: TextStyle(color: Colors.grey),
                                              maxLines: 3,
                                            ),
                                            SizedBox(width: screenWidth * 0.008),
                                            Text(
                                              "${newsController.selectedCategory.value}" ?? '',
                                              style: TextStyle(color: Colors.grey),
                                              maxLines: 3,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.bookmark_border_outlined),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget BuildCarouselIndicator() {
    final newsController = Get.find<NewsController>();
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
            5,
                (index) => Container(
              margin: EdgeInsets.symmetric(horizontal: 3),
              width: 20,
              height: 3,
              decoration: BoxDecoration(
                color: newsController.currentPage.value == index ? greencolor : Colors.grey,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryButton(String category) {
    final isSelected = category.toLowerCase() == Get.find<NewsController>().selectedCategory.value.toLowerCase();
    return Container(
      constraints: BoxConstraints(minWidth: 100, minHeight: 75),
      decoration: BoxDecoration(
        color: isSelected ? greencolor : Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: InkWell(
        onTap: () {
          Get.find<NewsController>().selectedCategory(category);
          Get.find<NewsController>().fetchNews();
        },
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Center(
            child: Text(
              category,
              style: TextStyle(
                color: isSelected ? Whitecolor : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
