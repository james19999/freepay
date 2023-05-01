import 'package:digitalbank/controllers/user_controller.dart';
import 'package:digitalbank/pages/splashlogout.dart';
import 'package:digitalbank/pages/toas/toas.dart';
import 'package:digitalbank/urls/baseurl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:digitalbank/pages/colors/color.dart';
import 'package:digitalbank/pages/styles/style.dart';
class UpadateIdentifyCostumer extends ConsumerWidget {
   UpadateIdentifyCostumer ({super.key});
    GlobalKey<FormState> _formk = GlobalKey<FormState>();
    TextEditingController _controlleridentify =TextEditingController();

    final  isloded =StateProvider((ref) => false);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller =ref.watch(AuthProviders);
    return Scaffold(
        appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text("Changer mon identifiant".tr),
       ),
         bottomSheet: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Container(
               width: Get.width,
                decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(5)),
                child: TextButton.icon(
                    onPressed: () async {
                      if (_formk.currentState!.validate()) {
                            ref.watch(isloded.notifier).state=true;
                          var chek = await controller.UpadateIdentify(_controlleridentify.text.trim());
                          if(chek==true){
                            Toas.getSnackbarsucess(appName, "Success");
                               Get.offAll(() => Splashlogout(),
                                transition: Transition.zoom);
                          }else{
                            Toas.getSnackbarEror(appName, "Error");
                            ref.watch(isloded.notifier).state=false;
                          } 
                          
                      }
                    },
                    icon:  ref.watch(isloded) == false
                        ? Icon(
                            Icons.outbound_outlined,
                            color: Colors.white,
                          )
                        : CircularProgressIndicator(
                            backgroundColor: Colors.white,
                            strokeWidth: 2,
                          ),
                    label: Text(
                      "Modifier".tr,
                      style: StyleText.copyWith(color: Colors.white),
                    )),
              ),
       ),
         body: SafeArea(
          child: SingleChildScrollView(
             physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(children: [
                Form(
                  key: _formk,
                  child: 
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _controlleridentify,
                      validator: (value) => value!.isEmpty
                          ? "Entrer le Nouveau identifiant".tr
                          : null,
                      decoration: InputDecoration(
                          label: Text("Entrer le Nouveau identifiant".tr),
                          hintText: "".tr,
                          suffixIcon:
                              Icon(Icons.verified_user),
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
                   )
               ],),
            ),
          )),
    );
  }
}