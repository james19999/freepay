import 'package:digitalbank/controllers/user_controller.dart';
import 'package:digitalbank/pages/card/Cards.dart';
import 'package:digitalbank/pages/colors/color.dart';
import 'package:digitalbank/pages/styles/style.dart';
import 'package:digitalbank/pages/toas/toas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  bool obscur = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController identifiantController = TextEditingController();
  GlobalKey<FormState> _forme = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(AuthProviders);
    return Scaffold(
      // appBar: AppBar(),
      bottomSheet: Container(
        height: Get.height * 0.04,
        width: Get.width,
        color: Colors.white,
        child: Text(
          "Powered by DIGITAL SERVICES",
          style: StyleText.copyWith(color: AppColors.mainColor, fontSize: 13),
          textAlign: TextAlign.center,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0)),
                  ),
                  height: Get.height * 0.4,
                  width: Get.width,
                  child: Padding(
                      padding: EdgeInsets.symmetric(vertical: Get.height * 0.1),
                      child: Column(
                        children: [
                          Text(
                            "Free Pay ",
                            style: StyleText.copyWith(
                                color: Colors.white, fontSize: 25),
                            textAlign: TextAlign.center,
                          ),
                          // SizedBox(
                          //   height: Get.height * 0.02,
                          // ),
                          // Text(
                          //   "Connectez-vous ",
                          //   style: StyleText.copyWith(
                          //       color: Colors.white, fontSize: 25),
                          //   textAlign: TextAlign.center,
                          // ),
                        ],
                      )),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: Get.height * 0.2, left: 8, right: 8),
                  child: Card(
                    elevation: 0.2,
                    color: Colors.white,
                    child: Container(
                      height: Get.height * 0.6,
                      width: Get.width,
                      child: Form(
                          key: _forme,
                          child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextFormField(
                                  controller: emailController,
                                  validator: (value) => value!.isEmpty
                                      ? "Entre votre adresse mail"
                                      : null,
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        borderSide: BorderSide(
                                          color: AppColors.mainColor,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        borderSide: BorderSide(
                                          color: AppColors.mainColor,
                                        ),
                                      ),
                                      isDense: true,
                                      hintText: "Votre adresse mail",
                                      prefixIcon: Icon(
                                        Icons.mail,
                                        color: AppColors.mainColor,
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50))),
                                ),
                                SizedBox(
                                  height: Get.height * 0.05,
                                ),
                                TextFormField(
                                  controller: identifiantController,
                                  validator: (value) => value!.isEmpty
                                      ? "Entrer votre identifiant"
                                      : null,
                                  obscureText: obscur,
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        borderSide: BorderSide(
                                          color: AppColors.mainColor,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        borderSide: BorderSide(
                                          color: AppColors.mainColor,
                                        ),
                                      ),
                                      hintText: "Votre identifiant",
                                      isDense: true,
                                      prefixIcon: Icon(
                                        Icons.key,
                                        color: AppColors.mainColor,
                                        size: 25,
                                      ),
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              obscur = !obscur;
                                            });
                                          },
                                          icon: Icon(
                                              color: AppColors.mainColor,
                                              obscur
                                                  ? Icons.visibility
                                                  : Icons.visibility_off)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50))),
                                ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.end,
                                //   children: [
                                //     Text("Mot de passe "),
                                //   ],
                                // ),
                                SizedBox(
                                  height: Get.height * 0.05,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.mainColor,
                                      borderRadius: BorderRadius.circular(50)),
                                  width: Get.width,
                                  height: Get.height * 0.06,
                                  child: TextButton.icon(
                                      onPressed: () async {
                                        if (_forme.currentState!.validate()) {
                                          var cheked =
                                              await controller.AuthConstumer(
                                                  emailController.text,
                                                  identifiantController.text);
                                          if (cheked == true) {
                                            Get.offAll(() => Cards(),
                                                transition: Transition.fade);
                                          } else {}
                                          Toas.getSnackbarEror("Free Pay",
                                              "Erreur de connexion vérifier vos informations");
                                        }
                                      },
                                      icon: Icon(
                                        Icons.lock_open_outlined,
                                        color: Colors.white,
                                      ),
                                      label: Text(
                                        "Se Connecter",
                                        style: StyleText.copyWith(
                                            color: Colors.white),
                                      )),
                                )
                              ],
                            ),
                          )),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
