import 'package:digitalbank/helper/images.dart';
import 'package:digitalbank/helper/responsive_helper.dart';
import 'package:digitalbank/models/company.dart';
import 'package:digitalbank/pages/colors/color.dart';
import 'package:digitalbank/pages/styles/style.dart';
import 'package:digitalbank/pages/transfer/widget_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CardCompany extends ConsumerWidget {
  final Company company;
  const CardCompany({super.key, required this.company});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                            company.domaine,
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
                    height: Get.height * 0.01,
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
