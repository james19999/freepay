import 'package:digitalbank/pages/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class DetailCard extends ConsumerStatefulWidget {
  const DetailCard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DetailCardState();
}

class _DetailCardState extends ConsumerState<DetailCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Card(
              elevation: 2,
              child: Container(
                  height: Get.height * 0.26,
                  width: Get.width,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "50000000 FCFA ",
                        style: StyleText,
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Text("Solde actul"),
                    ],
                  )),
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            Row(
              children: [
                Text(
                  "Carte detail",
                  style: StyleText.copyWith(fontSize: 18),
                ),
              ],
            )
          ]),
        ),
      )),
    );
  }
}
