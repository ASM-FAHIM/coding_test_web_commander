import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_commander_code_test/widget/big_text.dart';
import 'package:web_commander_code_test/widget/small_text.dart';

import '../../constant/colors.dart';
import '../../constant/dimensions.dart';
import '../../widget/app_icon.dart';

class DetailsScreen extends StatefulWidget {
  String imageUrl;
  String title;
  DetailsScreen({required this.title, required this.imageUrl, Key? key})
      : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Stack(
        children: [
          //background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.imgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "${widget.imageUrl}",
                  ),
                ),
              ),
            ),
          ),
          //icon button(back and cart)
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const AppIcon(
                    icon: Icons.arrow_back_ios,
                  ),
                ),
              ],
            ),
          ),
          //introduction field
          Positioned(
            top: Dimensions.imgSize - 20,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
                top: Dimensions.height20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20),
                  topLeft: Radius.circular(Dimensions.radius20),
                ),
                color: AppColor.backgroundColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(
                    text: widget.title,
                    color: AppColor.defWhite,
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  BigText(
                    text: 'Introduce',
                    color: AppColor.defWhite,
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: SmallText(
                        text:
                            "Titanic is a timeless romantic disaster film directed by James Cameron. "
                            "Set in 1912, the movie revolves around the ill-fated maiden voyage of the RMS Titanic. "
                            "The story follows the journey of Rose (Kate Winslet), a young upper-class woman trapped in an arranged engagement, "
                            "and Jack (Leonardo DiCaprio), a free-spirited artist from a lower-class background.As Rose embarks on the luxurious Titanic with her overbearing fiancé,"
                            " she feels suffocated by her privileged yet constricting life. However, everything changes when she crosses paths with Jack,"
                            " who teaches her the true meaning of freedom, love, and living life to the fullest.Their burgeoning romance becomes"
                            " the heart of the film as they navigate the societal boundaries and class divisions that seek to keep them apart."
                            " Amidst their love story, a disaster unfolds when the Titanic strikes an iceberg, leading to a thrilling and tragic"
                            " climax that tests their love and survival.The film masterfully combines breathtaking visuals, intricate set"
                            " designs, and compelling performances to immerse the audience in the grandeur and tragedy of the Titanic. "
                            "With a compelling blend of romance, drama, and suspense,",
                        color: AppColor.defWhite,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
