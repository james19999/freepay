import 'package:digitalbank/controllers/user_controller.dart';
import 'package:digitalbank/helper/images.dart';
import 'package:digitalbank/pages/company/compte.dart';
import 'package:digitalbank/pages/card/Cards.dart';
import 'package:digitalbank/pages/colors/color.dart';
import 'package:digitalbank/pages/splash_home.dart';
import 'package:digitalbank/pages/styles/style.dart';
import 'package:digitalbank/pages/toas/toas.dart';
import 'package:digitalbank/urls/baseurl.dart';
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
  bool isloade = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController identifiantController = TextEditingController();
  GlobalKey<FormState> _forme = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(AuthProviders);
    return WillPopScope(
        child: Scaffold(
          // appBar: AppBar(),
          bottomSheet: Container(
            height: Get.height * 0.04,
            width: Get.width,
            color: Colors.white,
            child: Text(
              "Copyright @  DIGITAL SERVICES",
              style:
                  StyleText.copyWith(color: AppColors.mainColor, fontSize: 13),
              textAlign: TextAlign.center,
            ),
          ),
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      logocontainer(),
                      Text(
                        "Connectez vous à votre carte Free Pay.".tr,
                        // style: StyleText,
                      ),
                      SizedBox(
                        height: Get.height * 0.022,
                      ),
                      Formes(controller)
                    ],
                  ),
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

  Image logocontainer() {
    return Image.asset(
      logo,
      height: Get.height * 0.2,
    );
  }

  Form Formes(UserCostumerController controller) {
    return Form(
        key: _forme,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                validator: (value) =>
                    value!.isEmpty ? "Entrer votre adresse mail".tr : null,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: AppColors.mainColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: AppColors.mainColor,
                      ),
                    ),
                    isDense: true,
                    hintText: "Votre adresse mail".tr,
                    prefixIcon: Icon(
                      Icons.mail,
                      color: AppColors.mainColor,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
              SizedBox(
                height: Get.height * 0.05,
              ),
              TextFormField(
                controller: identifiantController,
                validator: (value) =>
                    value!.isEmpty ? "Entrer votre identifiant".tr : null,
                obscureText: obscur,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: AppColors.mainColor,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: AppColors.mainColor,
                      ),
                    ),
                    hintText: "Votre identifiant".tr,
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
                            obscur ? Icons.visibility : Icons.visibility_off)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
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
                    borderRadius: BorderRadius.circular(5)),
                width: Get.width,
                height: Get.height * 0.06,
                child: TextButton.icon(
                    onPressed: () async {
                      if (_forme.currentState!.validate()) {
                        setState(() {
                            isloade = true;
                          });
                        var cheked = await controller.AuthConstumer(
                            emailController.text, identifiantController.text);
                        if (cheked == true) {
                          Get.offAll(() => SplashHome(),
                              transition: Transition.fade);
                          
                        } else {
                          Toas.getSnackbarEror(
                              appName,
                              "Erreur de connexion vérifier vos informations."
                                  .tr);
                            setState(() {
                            isloade = false;
                          });      
                        }
                      }
                    },
                    icon: Icon(
                      Icons.lock_open_outlined,
                      color: Colors.white,
                    ),
                    label: isloade == false
                        ? Text(
                            "Se Connecter.".tr,
                            style: StyleText.copyWith(color: Colors.white),
                          )
                        : CircularProgressIndicator.adaptive(
                            strokeWidth: 2,
                            backgroundColor: Colors.white,
                          )),
              ),

              SizedBox(
                height: Get.height * 0.034,
              ),
              MaterialButton(
                onPressed: () async {
                  Get.to(() => CreateCompte(), transition: Transition.fade);
                },
                child: Text("Créer un compte entreprise.".tr),
              )
            ],
          ),
        ));
  }
}
