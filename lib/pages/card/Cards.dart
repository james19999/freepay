import 'dart:convert';

import 'package:digitalbank/helper/images.dart';
import 'package:digitalbank/models/cart_data.dart';
import 'package:digitalbank/models/transaction.dart';
import 'package:digitalbank/pages/card/detail.dart';
import 'package:digitalbank/pages/colors/color.dart';
import 'package:digitalbank/pages/historiques/history.dart';
import 'package:digitalbank/pages/styles/style.dart';
import 'package:digitalbank/pages/transactions/transaction.dart';
import 'package:digitalbank/pages/transactions/widget_card.dart';
import 'package:digitalbank/pages/transfer/transfer_list.dart';
import 'package:digitalbank/services/carte_service.dart';
import 'package:digitalbank/services/transaction_service.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

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
  List<Transaction> transactions = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loader();
  }

  loader() async {
    await Service.getservice();

    transactions = await TransactionService.getalltransaction();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await TransactionService.getalltransaction();
                _refreshIndicatorKey.currentState?.show();
              },
              icon: Icon(
                Icons.refresh,
                size: 30,
              ))
        ],
        elevation: 0,
        title: Text(
          "Free Pay",
          style: StyleText.copyWith(fontSize: 25),
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
                          "assets/images/logo.jpeg",
                          fit: BoxFit.cover,
                        ))),
                  ),
                  Text(
                    "James",
                    style: TextStyle(color: AppColors.mainColor),
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
              ),
            ),
            ListTile(
              onTap: () async {
                // App.Tel();
              },
              leading: Icon(Icons.phone),
              trailing: Text(
                "+228 96 69 82 56",
              ),
            ),
            ListTile(
              onTap: () async {
                // Get.to(() => History(), transition: Transition.zoom);
              },
              leading: Icon(Icons.history),
              trailing: Text(
                "Historiques ",
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout_outlined),
              onTap: () async {
                Get.defaultDialog(
                    title: "f",
                    middleText: 'Voulez-vous vraiment vous déconnectez',
                    textCancel: "Non",
                    textConfirm: "Oui",
                    confirmTextColor: AppColors.mainColor,
                    cancelTextColor: AppColors.mainColor,
                    buttonColor: AppColors.mainColor,
                    radius: 1.0,
                    onConfirm: () async {
                      // var decon = await auth.LogoutUser();
                      // if (decon == false) {
                      //   Get.offAll(() => Logins(), transition: Transition.zoom);
                      // }
                    },
                    onCancel: () => {});
              },
              trailing: Text(
                'Déconnexion',
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          key: _refreshIndicatorKey,
          color: Colors.white,
          backgroundColor: Colors.blue,
          strokeWidth: 4.0,
          onRefresh: () async {
            await TransactionService.getalltransaction();

            return Future<void>.delayed(const Duration(seconds: 3));
          },
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
                        height: Get.height * 0.25,
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
                                    style:
                                        StyleText.copyWith(color: Colors.white),
                                  ),
                                  Text(
                                    "${company}",
                                    style:
                                        StyleText.copyWith(color: Colors.white),
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
                                  Image.asset(sim),
                                  Text(
                                    "Free Pay",
                                    style:
                                        StyleText.copyWith(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            // SizedBox(
                            //   height: Get.height * 0.1,
                            // ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    "${Cartes.code}",
                                    style: StyleText.copyWith(
                                        color: Colors.white,
                                        letterSpacing: 3.0),
                                  ),
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
                                    "${namecostumer}",
                                    style:
                                        StyleText.copyWith(color: Colors.white),
                                  ),
                                  Text(
                                    "${Cartes.created} ",
                                    style:
                                        StyleText.copyWith(color: Colors.white),
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
                        height: Get.height * 0.25,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      // ignore: sized_box_for_whitespace
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: InkWell(
                          onTap: () {
                            Get.to(() => DetailCard(),
                                transition: Transition.fade);
                          },
                          child: Container(
                            height: 50,
                            // color: AppColors.,
                            width: 50,
                            child: Icon(
                              Icons.credit_card,
                              size: 50,
                              color: AppColors.mainColor,
                            ),
                          ),
                        ),
                      ),
                      Text("Détail", style: StyleText.copyWith(fontSize: 13))
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          // Get.to(() => Montants(), transition: Transition.fade);
                        },
                        child: Container(
                          height: 50,
                          // color: AppColors.mainColor,
                          width: 50,
                          child: Icon(
                            Icons.money,
                            size: 50,
                            color: AppColors.mainColor,
                          ),
                        ),
                      ),
                      Text(
                        "Montant",
                        style: StyleText.copyWith(fontSize: 13),
                      )
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
                          height: 50,
                          // color: AppColors.mainColor,
                          width: 50,
                          child: Icon(
                            Icons.history,
                            size: 50,
                            color: AppColors.mainColor,
                          ),
                        ),
                      ),
                      Text("Transaction",
                          style: StyleText.copyWith(fontSize: 13))
                    ],
                  )
                ],
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(() => TransfertList(),
                              transition: Transition.fade);
                        },
                        child: Container(
                          height: 50,
                          // color: AppColors.,
                          width: 50,
                          child: Icon(
                            Icons.outbound_outlined,
                            size: 50,
                            color: AppColors.mainColor,
                          ),
                        ),
                      ),
                      Text("Transfert", style: StyleText.copyWith(fontSize: 13))
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(() => History(), transition: Transition.fade);
                        },
                        child: Container(
                          height: 50,
                          // color: AppColors.mainColor,
                          width: 50,
                          child: Icon(
                            Icons.history_toggle_off,
                            size: 50,
                            color: AppColors.mainColor,
                          ),
                        ),
                      ),
                      Text(
                        "Historique",
                        style: StyleText.copyWith(fontSize: 13),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 50,
                        // color: AppColors.mainColor,
                        width: 50,
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: AppColors.mainColor,
                        ),
                      ),
                      Text("Compte", style: StyleText.copyWith(fontSize: 13))
                    ],
                  ),
                ],
              ),
              Expanded(
                child: DraggableScrollableSheet(
                  initialChildSize: 0.8,
                  minChildSize: 0.3,
                  maxChildSize: 0.8,
                  builder: (context, scrollController) {
                    return Container(
                      margin: EdgeInsets.only(left: 0, right: 0),
                      decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: Get.width * 0.03,
                                    top: Get.height * 0.006),
                                child: Text(
                                  transactions.length > 0
                                      ? "Transactions recent  ${transactions.length}  "
                                      : "Transactions recent (0)",
                                  style: StyleText.copyWith(
                                      fontSize: 15, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: ListView.builder(
                                itemCount: transactions.length,
                                shrinkWrap: true,
                                controller: scrollController,
                                itemBuilder: (context, index) => Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: CardTransaction(
                                        transaction: transactions[index],
                                      ),
                                    )),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
