import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_commander_code_test/constant/dimensions.dart';
import 'package:web_commander_code_test/module/controller/home_controller.dart';
import 'package:web_commander_code_test/module/view/details_screen.dart';

import '../../constant/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController home = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    home.fetchPendingSoList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          title: Text('Movies'),
        ),
        body: Obx(() {
          return home.isLoading1.value
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        child: const CircularProgressIndicator(
                          color: AppColor.commonColor,
                        ),
                      ),
                      const Text(
                        'Loading...',
                        style: TextStyle(color: AppColor.defWhite),
                      )
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: ListView.builder(
                    itemCount: home.movieList.length,
                    itemBuilder: (context, index) {
                      var movies = home.movieList[index];
                      int id = movies.id;
                      String title = movies.title;
                      String imageUrl = movies.thumbnailUrl;
                      return Column(
                        children: [
                          ListTile(
                            onTap: () {
                              Get.to(() => DetailsScreen(
                                    title: title,
                                    imageUrl: imageUrl,
                                  ));
                            },
                            leading: Container(
                              width: 65,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(imageUrl),
                                ),
                              ),
                            ),
                            title: Text(title),
                            textColor: AppColor.defWhite,
                          ),
                          Container(
                            width: Dimensions.height320,
                            child: Divider(
                              thickness: 1.2,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      );
                    },
                    controller: home.scrollController,
                  ),
                );
        }),
      ),
    );
  }
}
