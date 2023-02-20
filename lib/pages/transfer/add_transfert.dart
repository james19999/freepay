import 'dart:math';

import 'package:digitalbank/controllers/transaction_controller.dart';
import 'package:digitalbank/helper/images.dart';
import 'package:digitalbank/models/transaction.dart';
import 'package:digitalbank/pages/colors/color.dart';
import 'package:digitalbank/pages/styles/style.dart';
import 'package:digitalbank/pages/toas/toas.dart';
import 'package:digitalbank/pages/transfer/detail_transfert.dart';
import 'package:digitalbank/services/transaction_service.dart';
import 'package:digitalbank/urls/baseurl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class AddTransfert extends ConsumerStatefulWidget {
  const AddTransfert({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTransfertState();
}

class _AddTransfertState extends ConsumerState<AddTransfert> {
  GlobalKey<FormState> _formk = GlobalKey<FormState>();

  TextEditingController _libelle = TextEditingController();
  TextEditingController _amount = TextEditingController();
  String number = Random().nextInt(999999).toString().padLeft(6, '0');
  bool isloded = false;
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(GlobalProviders);

    return Scaffold(
      appBar: AppBar(
        title: Text("Transfert"),
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
                    if (_formk.currentState!.validate()) {
                      var confirm = await TransactionService.newTransaction(
                          Transaction(
                              amount: _amount.text,
                              title: _libelle.text,
                              code_tansaction: number));
                      if (confirm == true) {
                        Get.offAll(() => DetailTransfert(
                              transaction: Transaction(
                                  amount: _amount.text,
                                  title: _libelle.text,
                                  code_tansaction: number),
                            ));
                        setState(() {
                          isloded = true;
                        });
                        data.getcarttransaction();
                        Toas.getSnackbarsucess(
                            appName, "Transaction effecftué");
                      } else {
                        Toas.getSnackbarEror(
                            appName, "Entrer un montant valide");
                      }
                    }
                  },
                  icon: isloded == false
                      ? Icon(
                          Icons.outbound_outlined,
                          color: Colors.white,
                        )
                      : CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          strokeWidth: 2,
                        ),
                  label: Text(
                    "Envoyer ",
                    style: StyleText.copyWith(color: Colors.white),
                  )),
            ),
          )),
      body: SafeArea(
          child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    Form(
                        key: _formk,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _libelle,
                              validator: (value) => value!.isEmpty
                                  ? "libelle du transfert"
                                  : null,
                              decoration: InputDecoration(
                                  label: Text("Libelle"),
                                  suffixIcon: Icon(Icons.note_alt),
                                  isDense: true,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      borderSide: BorderSide(
                                        color: AppColors.mainColor,
                                        width: 0.0,
                                      )),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.mainColor),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0))),
                            ),
                            SizedBox(
                              height: Get.height * 0.04,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: _amount,
                              validator: (value) => value!.isEmpty
                                  ? "Le montant du transfert"
                                  : null,
                              decoration: InputDecoration(
                                  label: Text("Montant"),
                                  hintText: "Ex:10000",
                                  suffixIcon:
                                      Icon(Icons.monetization_on_outlined),
                                  isDense: true,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      borderSide: BorderSide(
                                        color: AppColors.mainColor,
                                        width: 0.0,
                                      )),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.mainColor),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0))),
                            ),
                            SizedBox(
                              height: Get.height * 0.1,
                            ),
                            Card(
                              child: QrImage(
                                data: number,
                                version: QrVersions.auto,
                                size: 250,
                                gapless: false,
                                embeddedImage: AssetImage(logo),
                                embeddedImageStyle: QrEmbeddedImageStyle(
                                  size: Size(80, 80),
                                ),
                              ),
                            ),
                            Text(number),
                          ],
                        ))
                  ],
                ),
              ))),
    );
  }
}
