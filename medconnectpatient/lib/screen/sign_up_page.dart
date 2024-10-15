import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:medconnectpatient/screen/sign_in_page.dart';
import '../controllers/auth_controller.dart';
import '../models/user_model.dart';
import '../theme/constants.dart';
import 'home_pages.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nomController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  bool _isChecked = false;
  bool _passwordVisible = false;
  bool satusSignUp = false;

  GlobalKey<FormState> formkeySignUp = GlobalKey<FormState>();
  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Center(
            child: Image.asset(
              "assets/images/appbar_image.png",
              height: 40,
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: formkeySignUp,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Text(
                          "S'inscrire",
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _nomController,
                          maxLines: 1,
                          decoration: InputDecoration(
                            hintText: "Entrez votre nom et prénom",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            prefixIcon: Icon(Icons.person_outline_rounded),
                          ),
                          style:
                              Theme.of(context).inputDecorationTheme.labelStyle,
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: _emailController,
                          maxLines: 1,
                          decoration: InputDecoration(
                            hintText: "Entrez votre adresse e-mail",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            prefixIcon: Icon(Icons.email_outlined),
                          ),
                          style:
                              Theme.of(context).inputDecorationTheme.labelStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                  errorText:
                                      "* Veuillez saisir une adresse e-mail"),
                              EmailValidator(
                                  errorText:
                                      "Veuillez saisir une adresse e-mail valide"),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: _passwordController,
                          maxLines: 1,
                          obscureText: !_passwordVisible,
                          decoration: InputDecoration(
                            hintText: "Entrez votre mot de passe",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                          ),
                          style:
                              Theme.of(context).inputDecorationTheme.labelStyle,
                          validator: MultiValidator([
                            RequiredValidator(errorText: "* Obligatoire"),
                            MinLengthValidator(6,
                                errorText:
                                    "Le mot de passe doit comporter au moins 6 caractères"),
                            MaxLengthValidator(15,
                                errorText:
                                    "Le mot de passe ne doit pas comporter plus de 15 caractères")
                          ]),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: _phoneController,
                          maxLines: 1,
                          decoration: InputDecoration(
                            hintText: "Entrez votre N° téléphone",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            prefixIcon: Icon(Icons.phone_rounded),
                          ),
                          style:
                              Theme.of(context).inputDecorationTheme.labelStyle,
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: (newValue) {
                        setState(() {
                          _isChecked = newValue!;
                        });
                      },
                    ),
                    Expanded(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: Theme.of(context).textTheme.headline5!,
                          //.copyWith(fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                              text: "Je suis d'accord avec ",
                            ),
                            TextSpan(
                              text: "les Conditions d'utilisation ",
                              style: TextStyle(
                                color: kBlueColor,
                              ),
                            ),
                            TextSpan(
                              text: "et ",
                            ),
                            TextSpan(
                              text: "Politique de confidentialité ",
                              style: TextStyle(
                                color: kBlueColor,
                              ),
                            ),
                            TextSpan(
                              text: "de medConnect.",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 20,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        backgroundColor: _isChecked ? kBlueColor : kGreeyColor,
                      ),
                      onPressed: _isChecked
                          ? () async {
                              if (formkeySignUp.currentState!.validate()) {
                                final user = UserModel(
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text.trim(),
                                  fullName: _nomController.text.trim(),
                                  phoneNum: _phoneController.text.trim(),
                                );

                                satusSignUp = (await controller
                                    .createUserController(user))!;
                                if (satusSignUp) {
                                  UserModel usr = (await controller
                                      .getUserDetailsController())!;
                                  print(
                                      "Object Doctor Sign In name=${usr.fullName} \n id=${usr.id}");
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            HomePage(user: usr)),
                                  );
                                }
                              }
                            }
                          : null,
                      child: Text(
                        "Sign Up",
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              color: kWhiteColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SigninPage(),
                      ),
                    );
                  },
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: Theme.of(context).textTheme.headline5!,
                      //.copyWith(fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                          text: "Déjà inscrit ? ",
                        ),
                        TextSpan(
                          text: "Connectez-vous ici",
                          style: TextStyle(
                              color: kBlueColor, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
