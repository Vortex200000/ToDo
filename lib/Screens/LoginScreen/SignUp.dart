import 'package:flutter/material.dart';
import 'package:todo/Screens/LoginScreen/LoginScreenTaps.dart';
import 'package:todo/Shared/Firebase/FirebaseFunc.dart';
import 'package:todo/Styles/Mythemes.dart';

class SignUp extends StatelessWidget {
  static const String routeName = 'Signup';

  var FirstNameController = TextEditingController();
  var LastNameController = TextEditingController();
  var EmailController = TextEditingController();
  var PasswordController = TextEditingController();
  var ConfirmPasswordController = TextEditingController();
  var signkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: signkey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                controller: FirstNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please enter your first name";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    label: Text('please enter your first name'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                controller: LastNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please enter your last name";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    label: Text('Please enter your last name'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                controller: EmailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please enter your email";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    label: Text("Please enter your email"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                controller: PasswordController,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please enter your password";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    label: Text("Please enter your password"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                controller: ConfirmPasswordController,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please renter your password";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    label: Text("Please reenter your password"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .04,
            ),
            ElevatedButton(
                onPressed: () {
                  if (signkey.currentState!.validate()) {
                    FireBaseFunctions.CreateUser(
                        EmailController.text, PasswordController.text, () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, LoginSceenTaps.routeName, (route) => false);
                    }, (message) {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Error'),
                            content: Text(message),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {

                                    Navigator.pop(context);
                                  }, child: Text('Ok'))
                            ],
                          );
                        },
                      );
                    } , FirstNameController.text , LastNameController.text , EmailController.text);
                  }
                },
                child: Text('Create your account')),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            InkWell(
              onTap: () {

                Navigator.pushNamedAndRemoveUntil(context, LoginSceenTaps.routeName, (route) => false);
              },
              child: Text(
                "already have an account ? login now ",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Mythemes.brimaryColour),
              ),
            )
          ],
        ),
      ),
    );
  }
}
