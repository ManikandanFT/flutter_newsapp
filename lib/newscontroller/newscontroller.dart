import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../models/catagorymodel.dart';
import 'package:http/http.dart' as http;

class NewsController extends GetxController {
  var isLoading = true.obs;
  var articles = List<NewsArticle>.empty().obs;
  var selectedCategory = 'hotnews'.obs;
  var currentPage = 0.obs;
  RxBool isBookmarked = false.obs;

  void toggleBookmark() {
    isBookmarked.value = !isBookmarked.value;
  }

  List<String> categories = [
    'Hotnews',
    'Business',
    'Technology',
    'Science',
    'Health',
    'Entertainment',
  ];

  @override
  void onInit() {
    super.onInit();
    fetchNews();
  }

  void updateCurrentPage(int ind) {
    currentPage.value = ind;
  }

  Future<void> fetchNews() async {
    isLoading(true);
    try {
      final newsUrl = 'https://newsapi.org/v2/everything?q=${selectedCategory.value}&apiKey=ce3d7ed905eb4d5c8678356eb233228e';
      //final newsUrl = 'https://newsapi.org/v2/top-headlines?country=de&category=${selectedCategory.value}&apiKey=b080065e8d304a75afb4270943232c8f';
      final response = await http.get(Uri.parse(newsUrl));
      if (response.statusCode == 200) {
        final List<dynamic> rawData = json.decode(response.body)['articles'];
        articles(rawData.map((article) => NewsArticle.fromJson(article)).toList());
      }
    } finally {
      isLoading(false);
    }
  }
}