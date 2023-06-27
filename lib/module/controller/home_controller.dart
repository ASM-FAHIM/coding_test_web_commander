import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:web_commander_code_test/constant/app_constants.dart';

import '../model/movie_list_model.dart';

class HomeController extends GetxController {
  RxBool change = true.obs;
  var movieList = <MovieListModel>[].obs;
  RxBool isLoading1 = false.obs;

  void fetchPendingSoList() async {
    String completeUrl = AppConstants.baseurl + AppConstants.lasturl;
    print('========$completeUrl');
    try {
      isLoading1(true);
      var response = await http.get(Uri.parse(completeUrl));
      var soList = movieListModelFromJson(response.body);
      movieList.assignAll(soList.map((e) => e));
    } finally {
      isLoading1(false);
    }
  }

  final scrollController = ScrollController();
  final displayedData = <Map<String, dynamic>>[].obs;
  final isLoading = false.obs;

  final dataList = <Map<String, dynamic>>[
    // Add your data here or fetch it from an API
  ];

  final itemsPerPage = 10;
  var currentPage = 1;

  @override
  void onInit() {
    super.onInit();
    fetchNextPage(); // Fetch the first page of data when the controller is initialized
    scrollController.addListener(_scrollListener);
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  Future<void> fetchNextPage() async {
    if (isLoading.value) return;

    isLoading.value = true;

    await Future.delayed(Duration(seconds: 2));

    final newData = dataList
        .skip((currentPage - 1) * itemsPerPage)
        .take(itemsPerPage)
        .toList();

    displayedData.addAll(newData);

    currentPage++;

    isLoading.value = false;
  }

  void _scrollListener() {
    if (scrollController.position.maxScrollExtent ==
        scrollController.position.pixels) {
      fetchNextPage();
    }
  }
}
