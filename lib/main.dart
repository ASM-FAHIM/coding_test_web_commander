import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_commander_code_test/constant/app_constants.dart';
import 'package:web_commander_code_test/constant/colors.dart';
import 'package:web_commander_code_test/routes/route_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      theme: ThemeData(
        textTheme: GoogleFonts.manropeTextTheme(
          Theme.of(context).textTheme.apply(
                bodyColor: Colors.black,
                displayColor: Colors.black,
              ),
        ),
      ).copyWith(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColor.commonColor,
          elevation: 0,
        ),
      ),
      defaultTransition: Transition.zoom,
      initialRoute: RouteHelper.login,
      getPages: RouteHelper.routes,
    );
  }
}
