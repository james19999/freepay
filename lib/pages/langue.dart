import 'package:digitalbank/helper/local_storage.dart';
import 'package:digitalbank/pages/orboarding/orboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class Language extends ConsumerWidget {
   Language({super.key});
  final List locale = [
    {
      'name': 'ENGLISH',
      'locale': Locale('en', 'US'),
      'img': 'assets/images/en.png',
    },
    {
      'name': 'FRANCAIS',
      'locale': Locale('fr', 'FR'),
      'img': 'assets/images/fr.png',
    },
  ];

  updateLanguage(Locale locale)  async{
    Get.back();
    
    Get.updateLocale(locale);
  }

  buildLanguageDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: Text(
              'Choisissez votre langue'.tr,
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
            content: Container(
              width: double.maxFinite,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Image.asset(
                            "${locale[index]['img']}",
                            height: 25,
                          ),
                          title: Text(locale[index]['name']),
                          onTap: () async {
                             var locales =locale[index]['locale'];  
                             await  localstorage.changemylangue(true);

                             await localstorage.locallangue(locales.toString());
                        
                            //  updateLanguage(locales);
                          
                                    
                            Get.offAll(() => PageviewPage());
                          },
                        ));
                  },
                  itemCount: locale.length),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                buildLanguageDialog(context);
              },
              child: Text('Choisissez votre langue'.tr)),
        ],
      ),
    ));
  }
}
