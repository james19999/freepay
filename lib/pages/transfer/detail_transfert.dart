import 'package:digitalbank/helper/images.dart';
import 'package:digitalbank/models/transaction.dart';
import 'package:digitalbank/pages/card/Cards.dart';
import 'package:digitalbank/pages/colors/color.dart';
import 'package:digitalbank/pages/styles/style.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DetailTransfert extends StatelessWidget {
  final Transaction transaction;
  const DetailTransfert({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Detail transaction'.tr),
        centerTitle: true,
      ),
      bottomSheet: Container(
          height: Get.height * 0.1,
          width: Get.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.mainColor.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(18.0),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(5)),
              child: TextButton.icon(
                  onPressed: () async {
                    Get.to(() => Cards(), transition: Transition.fade);
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Nouvelle transaction".tr,
                    style: StyleText.copyWith(color: Colors.white),
                  )),
            ),
          )),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              width: Get.width * 0.7,
              height: Get.height * 0.46,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    child: QrImage(
                      data: transaction.code_tansaction,
                      version: QrVersions.auto,
                      size: 200,
                      gapless: false,
                      embeddedImage: AssetImage(logos),
                      embeddedImageStyle: QrEmbeddedImageStyle(
                        size: Size(80, 80),
                      ),
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(5)),
                      height: 25,
                      width: Get.width * 0.6,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Prix".tr,
                              style: StyleText.copyWith(
                                  color: Colors.white, fontSize: 15),
                            ),
                            Text(
                              "${transaction.amount} XOF",
                              style: StyleText.copyWith(
                                  color: Colors.white, fontSize: 15),
                            ),
                          ],
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Text(
                            transaction.title,
                            style: StyleText.copyWith(
                                color: Colors.black, fontSize: 15),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        Text(
                          "${transaction.code_tansaction}",
                          style: StyleText.copyWith(
                              color: Colors.black, fontSize: 15),
                        )
                      ],
                    ),
                  ),

                  Container(
                      decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(5)),
                      height: Get.height * 0.05,
                      width: Get.width * 0.6,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          child: Icon(
                            Icons.share,
                            color: Colors.white,
                          ))),
                  // SizedBox(
                  //   height: Get.height * 0.02,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Flexible(
                  //       child: Padding(
                  //         padding: const EdgeInsets.all(8.0),
                  //         child: Text(
                  //           transaction.title,
                  //           overflow: TextOverflow.ellipsis,
                  //           maxLines: 2,
                  //         ),
                  //       ),
                  //     ),
                  //     Container(
                  //       child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: [
                  //             Text(
                  //               "${transaction.amount} F",
                  //             ),
                  //             SizedBox(
                  //               width: 14,
                  //             ),
                  //           ]),
                  //     )
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: Get.height * 0.012,
                  // ),
                  // CustomDivider(),
                  // SizedBox(
                  //   height: Get.height * 0.011,
                  // ),

                  // Text("${transaction.code_tansaction}")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
