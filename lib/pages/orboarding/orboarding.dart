import 'package:digitalbank/helper/images.dart';
import 'package:digitalbank/helper/local_storage.dart';
import 'package:digitalbank/pages/auth/login.dart';
import 'package:digitalbank/pages/colors/color.dart';
import 'package:digitalbank/pages/styles/style.dart';
import 'package:digitalbank/urls/baseurl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class PageviewPage extends ConsumerStatefulWidget {
  const PageviewPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PageviewPageState();
}

class _PageviewPageState extends ConsumerState<PageviewPage> {
  @override
  int currentIndex = 0;
  PageController? _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  List<dynamic> contents = [
    {
      "title":
          "Acheter pour vous et pour vos proches en toute sécurité grâce Free Pay univers togolais."
              .tr,
      "image": s1
    },
    {
      "title":
          "Effectuer des paiements ou achats depuis votre carte vers une boutique Free Pay."
              .tr,
      "image": s2
    },
    {
      "title":
          "Free Pay aide l'entreprise à fideliser ses client et à augmenter sont chiffres d'affaires."
              .tr,
      "image": s3
    },
  ];

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  controller: _pageController,
                  itemCount: contents.length,
                  onPageChanged: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                  itemBuilder: (_, i) {
                    var page = contents[i];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.42,
                            child: Image.asset(page['image'])),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Container(
                                  width: Get.width * 0.69,
                                  child: Text(
                                    page['title'],
                                    style: TextStyle(
                                        fontSize: fontsizes,
                                        color: Colors.grey),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        SizedBox(
                          height: 1,
                        ),
                      ],
                    );
                  }),
            ),
            Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(contents.length,
                      (index) => ContainerDot(index, context))),
            ),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              margin: EdgeInsets.all(50),
              height: Get.height * 0.07,
              width: double.infinity,
              // color: App.mainColor,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.mainColor)),
                onPressed: () {
                  if (currentIndex == contents.length - 1) {
                    Get.off(() => Login(), transition: Transition.fade);
                  }
                  _pageController!.nextPage(
                      duration: Duration(microseconds: 10),
                      curve: Curves.bounceIn);
                },
                child: Text(
                    currentIndex == contents.length - 1
                        ? 'Commencer'.tr
                        : "Suivant".tr,
                    style: TextStyle(
                      fontSize: fontsizes,
                    )),
              ),
            ),
            
          ],
        ),
      ),
    );
  }

  Container ContainerDot(int index, BuildContext context) => Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: AppColors.mainColor, borderRadius: BorderRadius.circular(60)),
      height: 10,
      width: currentIndex == index ? 20 : 10);
}
