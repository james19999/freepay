import 'package:digitalbank/controllers/transaction_controller.dart';
import 'package:digitalbank/helper/date_convert.dart';
import 'package:digitalbank/helper/images.dart';
import 'package:digitalbank/models/transaction.dart';
import 'package:digitalbank/pages/card/Cards.dart';
import 'package:digitalbank/pages/colors/color.dart';
import 'package:digitalbank/pages/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DetailTransaction extends ConsumerWidget {
  final Transaction transactions;
  const DetailTransaction({super.key, required this.transactions});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(GlobalProviders);

    return Scaffold(
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
                      if (transactions.status == 'pending') {
                        Get.defaultDialog(
                          title:
                              "Annuler la transaction ${transactions.code_tansaction}",
                          middleText: "",
                          onConfirm: () async {
                            await data.canceledtransaction(
                                transactions.code_tansaction);
                            data.getcarttransaction();
                            Get.to(() => Cards());
                          },
                          onCancel: () {},
                          radius: 10,
                          textCancel: "Non",
                          textConfirm: "Oui",
                          confirmTextColor: Colors.white,
                          cancelTextColor: AppColors.mainColor,
                          buttonColor: AppColors.mainColor,
                        );
                      }
                    },
                    icon: Icon(
                      Icons.qr_code,
                      color: Colors.white,
                    ),
                    label: Text(
                      transactions.status == 'pending' ? 'Annuler' : 'Terminer',
                      style: StyleText.copyWith(color: Colors.white),
                    )),
              ),
            )),
        appBar: AppBar(
          elevation: 0,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                  height: Get.height * 0.35,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50.0),
                        bottomRight: Radius.circular(50.0)),
                  ),
                  child: Center(
                    child: QrImage(
                      foregroundColor: Colors.white,
                      data: transactions.code_tansaction,
                      version: QrVersions.auto,
                      size: 160,
                      gapless: false,
                      embeddedImage: AssetImage(logo),
                      embeddedImageStyle: QrEmbeddedImageStyle(
                        size: Size(30, 30),
                      ),
                    ),
                  )),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        transactions.title,
                        style: StyleText.copyWith(fontSize: 15),
                      ),
                      trailing: Text(
                        "${transactions.amount} F",
                        style: StyleText.copyWith(fontSize: 15),
                      ),
                    ),
                    Divider(
                      height: 2,
                      thickness: 1,
                    ),
                    ListTile(
                      title: Text(
                        "Status",
                        style: StyleText.copyWith(fontSize: 15),
                      ),
                      trailing: Text(
                        transactions.status == 'pending'
                            ? 'En cours'
                            : transactions.status == 'success'
                                ? 'Terminer'
                                : transactions.status == 'cancelled'
                                    ? 'Annuler'
                                    : '',
                        style: StyleText.copyWith(
                          fontSize: 14,
                          color: transactions.status == 'pending'
                              ? Colors.orange
                              : transactions.status == 'success'
                                  ? Colors.green
                                  : transactions.status == 'cancelled'
                                      ? Colors.red
                                      : Colors.transparent,
                        ),
                      ),
                    ),
                    Divider(
                      height: 2,
                      thickness: 1,
                    ),
                    ListTile(
                      title: Text(
                        "Code",
                        style: StyleText.copyWith(fontSize: 15),
                      ),
                      trailing: Text(
                        transactions.code_tansaction,
                        style: StyleText.copyWith(fontSize: 15),
                      ),
                    ),
                    Divider(
                      height: 2,
                      thickness: 1,
                    ),
                    ListTile(
                      title: Text(
                        "Date",
                        style: StyleText.copyWith(fontSize: 15),
                      ),
                      trailing: Text(
                        DateConverter.estimatedDate(transactions.created),
                        style: StyleText.copyWith(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
