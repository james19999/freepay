import 'package:digitalbank/helper/images.dart';
import 'package:digitalbank/helper/responsive_helper.dart';
import 'package:digitalbank/models/company/company.dart';
import 'package:digitalbank/pages/colors/color.dart';
import 'package:digitalbank/pages/styles/style.dart';
import 'package:digitalbank/pages/transfer/widget_divider.dart';
import 'package:digitalbank/urls/baseurl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CardCompany extends ConsumerWidget {
  final Company company;
  const CardCompany({super.key, required this.company});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(11.0),
        child: ZoomTapAnimation(
          child: Container(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: Get.height * 0.47,
                  child: Column(children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8.0),
                              topLeft: Radius.circular(8.0)),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  NetworkImage("${BaseImage}${company.img}"))),
                      height: Get.height * 0.2,
                      child: Container(
                        decoration: BoxDecoration(
                          color: company.status == 1
                              ? Colors.transparent
                              : Colors.transparent.withOpacity(0.6),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8.0),
                              topLeft: Radius.circular(8.0)),
                        ),
                        height: Get.height * 0.2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                company.name,
                                style: StyleText,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Text(company.description,
                                    maxLines: 2,
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 13)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.phone_android,
                                color: AppColors.mainColor,
                              ),
                              SizedBox(width: Get.width * 0.03),
                              Text(company.phone),
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.011,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.email,
                                color: AppColors.mainColor,
                              ),
                              SizedBox(width: Get.width * 0.03),
                              Text(company.email),
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: AppColors.mainColor,
                              ),
                              SizedBox(width: Get.width * 0.03),
                              Flexible(
                                child: Text(company.adress,
                                maxLines: 1,
                                style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 13)),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 15.0),
                  child: Container(
                   
                    height: Get.height * 0.054,
                    width: Get.width * 0.3,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child:company.status == 0 ? Icon(Icons.check_circle_outline,color:Colors.black)
                         :Icon(Icons.check_circle_outline,color:AppColors.mainColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ZoomTapAnimation newMethod(BuildContext context) {
    return ZoomTapAnimation(
      child: Container(
        child: Center(
            child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Card(
            color: AppColors.mainColor,
            elevation: 3,
            child: Container(
              height: ResponsiveHelper.isMobile(context)
                  ? Get.height * 0.26
                  : ResponsiveHelper.isLandscape(context)
                      ? Get.height * 0.5
                      : Get.height * 0.25,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Free Pay",
                          style: StyleText.copyWith(
                            color: Colors.white,
                            overflow: TextOverflow.ellipsis,
                            fontSize: fontsizes,
                          ),
                          maxLines: 2,
                        ),
                        Flexible(
                          child: Text(
                            "${company.name}",
                            style: StyleText.copyWith(
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis,
                              fontSize: fontsizes,
                            ),
                            maxLines: 2,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.qr_code,
                          color: Colors.white,
                          size: 40,
                        ),
                        Container(
                            decoration: BoxDecoration(
                                color: company.status == 1
                                    ? Colors.black
                                    : Colors.red,
                                borderRadius: BorderRadius.circular(5)),
                            height: 30,
                            width: 100,
                            child: Row(
                              children: [
                                company.status == 1
                                    ? Icon(
                                        Icons.check_circle_outline,
                                        color: Colors.white,
                                      )
                                    : Icon(
                                        Icons.lock,
                                        color: Colors.white,
                                      ),
                                Text(
                                  company.status == 1 ? "Actif" : "Inactif",
                                  style: StyleText.copyWith(
                                    color: Colors.white,
                                    fontSize: fontsizes,
                                  ),
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            "",
                            style: StyleText.copyWith(
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis,
                              fontSize: fontsizes,
                            ),
                            maxLines: 2,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            company.email,
                            style: StyleText.copyWith(
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis,
                              fontSize: fontsizes,
                            ),
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            company.adress,
                            style: StyleText.copyWith(
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis,
                              fontSize: fontsizes,
                            ),
                            maxLines: 2,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            company.phone,
                            style: StyleText.copyWith(
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis,
                              fontSize: fontsizes,
                            ),
                            maxLines: 2,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
