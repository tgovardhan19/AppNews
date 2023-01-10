
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../apiservices/logger.dart';
import '../../models/model.dart';
 import 'package:url_launcher/url_launcher.dart';
import 'package:get/route_manager.dart';

class HomeNewsController extends GetxController {
  Dio dio = Dio();
  List<Welcome> newsList = [];
  bool isLoading = false;
  static String _apiKey = 'a83521b024bc4481848877608c8fc6ee';
  String selectedCountry = "Australia";
  String tempCountry = "Australia";
  String selectedCountryCode = "at";
  int? selectedValue = 4;
  List<Map<String, String>> countriesList = [
    
    {"England": "eng"},
    {"India": "in"},
    {"Nepal": "np"},
    {"Australia": "at"},
    {"America": "am"},
    {"West Indies": "wi"},
    {"Indonesia": "in"},
   
  ];

  String _url =
      'https://newsapi.org/v2/everything?q=tesla&from=2022-12-09&sortBy=publishedAt&apiKey=a83521b024bc4481848877608c8fc6ee';
  bool hasMoreItems = true;
  int currentPage = 1;
  ScrollController scrollController = ScrollController();

  get sortBy => null;

  get changeSortCategory => null;
  @override
  void onInit() {
    super.onInit();
    getNews(
        apiUrl:
            "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=a83521b024bc4481848877608c8fc6ee");
    scrollController.addListener(() {
      double _maxScroll = scrollController.position.maxScrollExtent;
      double _currentScroll = scrollController.position.pixels;
      double delta = Get.height * 0.25;
      if (_maxScroll - _currentScroll <= delta) {
        currentPage += 1;
        logger.d('scrollListner');
        getNews(
            apiUrl:
                "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=a83521b024bc4481848877608c8fc6ee");
      }
    });
  }

  Future getNews({required String apiUrl}) async {
    if (!hasMoreItems) return;
    try {
      
      List<Welcome> tempNewsList = [];
      Response response = await dio.get(_url);
      logger.d('getNews response $response');
      if (response.statusCode == 200) {
        if (response.data['articles'].length < 10) {
          logger.d("hasMore data $hasMoreItems");
          hasMoreItems = false;
        } else {
          hasMoreItems = true;
          logger.d("hasMore $hasMoreItems");
        }
        {
          for (Map<String, dynamic> json in response.data['articles']) {
            Welcome welcome = Welcome.fromJson(json);
            tempNewsList.add(welcome);
            logger.d(tempNewsList.length);
          }
          newsList.addAll(tempNewsList);
          logger.d("newsResults:$newsList");
        }
      }
    } catch (e) {
    } finally {
      
    }
  }

  void launchURL({required String url}) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  resertNewsData() {
    hasMoreItems = true;
    newsList.clear();
    currentPage = 1;
  }

  
  void getCountryNews() {
    logger.d('homeNewsController.tempCountry $tempCountry');
    logger.d('homeNewsController.selectedCountry $selectedCountry');
    resertNewsData();
    getNews(
      apiUrl:
          "https://newsapi.org/v2/top-headlines?country=$selectedCountryCode&apikey=$_apiKey",
    );
  }  
}
