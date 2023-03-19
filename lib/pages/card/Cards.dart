import 'dart:convert';

import 'package:digitalbank/controllers/transaction_controller.dart';
import 'package:digitalbank/controllers/user_controller.dart';
import 'package:digitalbank/helper/images.dart';
import 'package:digitalbank/helper/local_storage.dart';
import 'package:digitalbank/helper/responsive_helper.dart';
import 'package:digitalbank/models/cart_data.dart';
import 'package:digitalbank/models/transaction.dart';
import 'package:digitalbank/pages/auth/login.dart';
import 'package:digitalbank/pages/card/detail.dart';
import 'package:digitalbank/pages/colors/color.dart';
import 'package:digitalbank/pages/company/company_list.dart';
import 'package:digitalbank/pages/historiques/history.dart';
import 'package:digitalbank/pages/splashlogout.dart';
import 'package:digitalbank/pages/styles/style.dart';
import 'package:digitalbank/pages/toas/toas.dart';
import 'package:digitalbank/pages/transactions/canceld_list.dart';
import 'package:digitalbank/pages/transactions/history_transaction.dart';
import 'package:digitalbank/pages/transactions/peding_list.dart';
import 'package:digitalbank/pages/transactions/succes_list.dart';
import 'package:digitalbank/pages/transactions/transaction.dart';
import 'package:digitalbank/pages/transactions/widget_card.dart';
import 'package:digitalbank/pages/transfer/add_transfert.dart';
import 'package:digitalbank/pages/transfer/transfer_list.dart';
import 'package:digitalbank/services/carte_service.dart';
import 'package:digitalbank/services/transaction_service.dart';
import 'package:digitalbank/urls/baseurl.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class Cards extends ConsumerStatefulWidget {
  const Cards({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CardsState();
}

class _CardsState extends ConsumerState<Cards> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalProvider = ref.watch(GlobalProviders);
    final auth = ref.watch(AuthProviders);

    return WillPopScope(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.mainColor,
            onPressed: () async {
              GlobalProvider.getservice();
              GlobalProvider.getcarttransaction();
              _refreshIndicatorKey.currentState?.show();
            },
            child: const Icon(Icons.refresh),
          ),
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            actions: [
              // IconButton(
              //     onPressed: () {
              //       Get.to(() => CompanyList(), transition: Transition.fade);
              //     },
              //     icon: Icon(
              //       Icons.remove_red_eye_sharp,
              //       color: Colors.white,
              //     ))
            ],
            elevation: 0,
            title: Image.asset(
              logos,
              height: 70,
            ),
            centerTitle: true,
          ),
          drawer: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.mainColor,
                        radius: 50,
                        child: SizedBox(
                            width: 80,
                            height: 80,
                            child: ClipOval(
                                child: Image.asset(
                              logos,
                              fit: BoxFit.cover,
                            ))),
                      ),
                      Text(
                        localstorage.username,
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                // ListTile(
                //   title: const Text('Item 1'),
                //   onTap: () {},
                // ),
                ListTile(
                  onTap: () {
                    // App.phone();
                  },
                  leading: Icon(Icons.phone_android),
                  trailing: Text(
                    "+228 92 21 25 30",
                      style: StyleText.copyWith(fontSize: 14),
                       
                  ),
                ),
                ListTile(
                  onTap: () async {
                    // App.Tel();
                  },
                  leading: Icon(Icons.phone),
                  trailing: Text(
                    "+228 96 69 82 56",
                    style: StyleText.copyWith(fontSize: 14),
                      
                  ),
                ),
                ListTile(
                  onTap: () async {
                    Get.to(() => HistoryTransaction(),
                        transition: Transition.zoom);
                  },
                  leading: Icon(Icons.history),
                  trailing: Text(
                    "Historique".tr,
                   style: StyleText.copyWith(fontSize: 14),

                  ),
                ),
                ListTile(
            onTap: () {
              Get.showSnackbar(GetSnackBar(
                title: "",
                message: "",
                messageText: Column(
                  children: [
                    Container(
                      width: Get.width * 0.6,
                      child: Card(
                        elevation: 0,
                        child: ListTile(
                          onTap: () {
                            Get.updateLocale(Locale('fr', 'FR'));
                            Get.back();

                          },
                          title: Text("Français".tr),
                          trailing: Image.asset(
                             "assets/images/fr.png",
                            width: 50,
                          ),
                        ),
                      ),
                    ),

                    Container(
                      width: Get.width * 0.6,
                      child: Card(
                        elevation: 0,
                        child: ListTile(
                          onTap: () {
                            Get.updateLocale(Locale('en', 'US'));
                            Get.back();
                          },
                          title: Text("Anglais".tr),
                          trailing: Image.asset(
                            "assets/images/en.png",
                            width: 50,
                          ),
                        ),
                      ),
                    )

                  ],
                ),
                backgroundColor: Colors.transparent,
                onTap: (snack) {
                  Get.back();
                },
              ));
            },
            leading: Icon(
              Icons.translate_rounded,
            ),
        
            trailing:  Text(
              "Langue".tr,
              style: StyleText.copyWith(fontSize: 14),
            ),),
                ListTile(
                  leading: Icon(Icons.logout_outlined),
                  onTap: () async {
                    Get.defaultDialog(
                        title: appName,
                        middleText: 'Voulez-vous vraiment vous déconnectez'.tr,
                        textCancel: "Non".tr,
                        textConfirm: "Oui".tr,
                        confirmTextColor: Colors.white,
                        cancelTextColor: AppColors.mainColor,
                        buttonColor: AppColors.mainColor,
                        radius: 1.0,
                        onConfirm: () async {
                          var decon = await auth.LogoutUser();
                          if (decon == true) {
                            Get.offAll(() => Splashlogout(),
                                transition: Transition.zoom);
                          }
                        },
                        onCancel: () => {});
                  },
                  trailing: Text(
                    'Déconnexion'.tr,
                    style: StyleText.copyWith(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: RefreshIndicator(
              key: _refreshIndicatorKey,
              color: Colors.white,
              backgroundColor: AppColors.mainColor,
              strokeWidth: 4.0,
              onRefresh: () async {
                await TransactionService.getalltransaction();

                return Future<void>.delayed(const Duration(seconds: 3));
              },
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    FlipCard(
                      fill: Fill
                          .fillBack, // Fill the back side of the card to make in the same size as the front.
                      direction: FlipDirection.HORIZONTAL, // default
                      side: CardSide.FRONT, // The side to initially display.
                      front: Container(
                        child: Center(
                            child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Card(
                            color: AppColors.mainColor,
                            elevation: 3,
                            child: Container(
                              height: ResponsiveHelper.isMobile(context)
                                  ? Get.height * 0.25
                                  : ResponsiveHelper.isLandscape(context)
                                      ? Get.height * 0.5
                                      : Get.height * 0.25,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Free Pay",
                                          style: StyleText.copyWith(
                                            color: Colors.white,
                                            fontSize: fontsizes,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          maxLines: 1,
                                        ),
                                        Text(
                                          "${company}",
                                          style: StyleText.copyWith(
                                              color: Colors.white,
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: fontsizes),
                                          maxLines: 1,
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.qr_code,
                                          color: Colors.white,
                                          size: 40,
                                        ),
                                        Container(
                                            decoration: BoxDecoration(
                                                color: Cartes.status == 1
                                                    ? Colors.black
                                                    : Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            height: 30,
                                            width: 100,
                                            child: Row(
                                              children: [
                                                Cartes.status == 1
                                                    ? Icon(
                                                        Icons
                                                            .check_circle_outline,
                                                        color: Colors.white,
                                                      )
                                                    : Icon(
                                                        Icons.lock,
                                                        color: Colors.white,
                                                      ),
                                                Text(
                                                  Cartes.status == 1
                                                      ? "Activé".tr
                                                      : "Désactivé".tr,
                                                  style: StyleText.copyWith(
                                                      color: Colors.white,
                                                      fontSize: 13),
                                                )
                                              ],
                                            )),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${Cartes.code == null ? '' : Cartes.code}",
                                          style: StyleText.copyWith(
                                              color: Colors.white,
                                              fontSize: fontsizes,
                                              overflow: TextOverflow.ellipsis,
                                              letterSpacing: 3.0),
                                        ),
                                        Text(
                                          "${Cartes.amount == null ? '' : Cartes.amount} XOF",
                                          style: StyleText.copyWith(
                                              color: Colors.white,
                                              fontSize: fontsizes,
                                              letterSpacing: 3.0),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "${namecostumer}",
                                            style: StyleText.copyWith(
                                                color: Colors.white,
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: fontsizes),
                                            maxLines: 1,
                                          ),
                                        ),
                                        Text(
                                          "${Cartes.created == null ? '' : Cartes.created} ",
                                          style: StyleText.copyWith(
                                              color: Colors.white,
                                              fontSize: fontsizes),
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
                      back: Container(
                        child: Center(
                            child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Card(
                            color: AppColors.mainColor,
                            elevation: 3,
                            child: Container(
                              height: ResponsiveHelper.isMobile(context)
                                  ? Get.height * 0.25
                                  : ResponsiveHelper.isLandscape(context)
                                      ? Get.height * 0.5
                                      : Get.height * 0.25,
                              width: Get.width,
                              child: QrImage(
                                foregroundColor: Colors.white,
                                data: Cartes.code.toString(),
                                version: QrVersions.auto,
                                size: 250,
                                gapless: false,
                              ),
                            ),
                          ),
                        )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              // ignore: sized_box_for_whitespace
                              InkWell(
                                onTap: () {
                                  Get.to(() => CanceldList(),
                                      transition: Transition.fade);
                                },
                                child: ZoomTapAnimation(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5)),
                                    height: ResponsiveHelper.isMobile(context)
                                        ? Get.height * 0.1
                                        : ResponsiveHelper.isLandscape(context)
                                            ? Get.height * 0.2
                                            : Get.height * 0.1,
                                    width: 90,
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.cancel_outlined,
                                          size: 50,
                                          color: Colors.red,
                                        ),
                                        Text(
                                            "${"Annuler".tr} ${GlobalProvider.cancelde == null ? 0 : GlobalProvider.cancelde.length}",
                                            style: StyleText.copyWith(
                                                fontSize: 13))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  // Get.to(() => Montants(), transition: Transition.fade);
                                  Get.to(() => PadingList(),
                                      transition: Transition.fade);
                                },
                                child: ZoomTapAnimation(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5)),
                                    height: ResponsiveHelper.isMobile(context)
                                        ? Get.height * 0.1
                                        : ResponsiveHelper.isLandscape(context)
                                            ? Get.height * 0.2
                                            : Get.height * 0.1,
                                    width: 90,
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.loop_sharp,
                                          size: 50,
                                          color: Colors.orange,
                                        ),
                                        Text(
                                          "${"En cours".tr} ${GlobalProvider.pading == null ? 0 : GlobalProvider.pading.length}",
                                          style:
                                              StyleText.copyWith(fontSize: 13),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.to(() => SuccesList(),
                                      transition: Transition.fade);
                                },
                                child: ZoomTapAnimation(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5)),
                                    height: ResponsiveHelper.isMobile(context)
                                        ? Get.height * 0.1
                                        : ResponsiveHelper.isLandscape(context)
                                            ? Get.height * 0.2
                                            : Get.height * 0.1,
                                    width: 90,
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.check_circle_outline,
                                          size: 50,
                                          color: Colors.green,
                                        ),
                                        Text(
                                            "${"Valider".tr} ${GlobalProvider.success == null ? 0 : GlobalProvider.success.length} ",
                                            style: StyleText.copyWith(
                                                fontSize: 13))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Cartes.status == 1
                                      ? Get.to(() => AddTransfert(),
                                          transition: Transition.fade)
                                      : Toas.getSnackbarEror(appName,
                                          "Votre carte à été bloquée".tr);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5)),
                                  height: ResponsiveHelper.isMobile(context)
                                      ? Get.height * 0.1
                                      : ResponsiveHelper.isLandscape(context)
                                          ? Get.height * 0.2
                                          : Get.height * 0.1,
                                  width: 90,
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.outbound_outlined,
                                        size: 50,
                                        color: AppColors.mainColor,
                                      ),
                                      Text("Transfert".tr,
                                          style:
                                              StyleText.copyWith(fontSize: 13))
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.to(() => HistoryTransaction(),
                                      transition: Transition.fade);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5)),
                                  height: ResponsiveHelper.isMobile(context)
                                      ? Get.height * 0.1
                                      : ResponsiveHelper.isLandscape(context)
                                          ? Get.height * 0.2
                                          : Get.height * 0.1,
                                  width: 90,
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.history_toggle_off,
                                        size: 50,
                                        color: AppColors.mainColor,
                                      ),
                                      Text(
                                        "Historique".tr,
                                        style: StyleText.copyWith(fontSize: 13),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.to(() => Transactionlist(),
                                      transition: Transition.fade);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5)),
                                  height: ResponsiveHelper.isMobile(context)
                                      ? Get.height * 0.1
                                      : ResponsiveHelper.isLandscape(context)
                                          ? Get.height * 0.2
                                          : Get.height * 0.1,
                                  width: 90,
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.history,
                                        size: 50,
                                        color: AppColors.mainColor,
                                      ),
                                      Text("Transaction".tr,
                                          style:
                                              StyleText.copyWith(fontSize: 13))
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, bottom: 6.0),
                      child: Row(
                        children: [
                          Text(
                            "Transaction recent".tr,
                            style: StyleText.copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: Get.height * 0.3,
                      width: ResponsiveHelper.isMobile(context)
                          ? Get.width * 0.96
                          : ResponsiveHelper.isLandscape(context)
                              ? Get.width
                              : Get.width * 0.96,
                      color: Colors.white,
                      child: GlobalProvider.table.length > 0
                          ? ListView.builder(
                              itemCount: GlobalProvider.table.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => CardTransaction(
                                    transaction: GlobalProvider.table[index],
                                  ))
                          : Center(
                              child: Text(
                              "Aucune transaction n'a été effectuée".tr,
                              style: StyleText.copyWith(fontSize: 16),
                            )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        onWillPop: () async {
          final shouldPop = await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Voulez vous fermer l'application ?".tr),
                actionsAlignment: MainAxisAlignment.spaceEvenly,
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: Text('Oui'.tr),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: Text('Non'.tr),
                  ),
                ],
              );
            },
          );
          return shouldPop!;
        });
  }
}
