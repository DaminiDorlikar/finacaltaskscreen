
import 'package:finacial/commonview/common_heigthconttent.dart';
import 'package:finacial/constantcontent/constant_color.dart';
import 'package:finacial/constantcontent/constant_text.dart';
import 'package:finacial/resigtaion/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mobileController = TextEditingController();
  final RegExp mobileRegExp = RegExp(r'^[0-9]{10}$');
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Text(
                loginText,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: appnThemeColor),
              )),
              const CommonHeigthContent(height: 20.0),
              Center(
                child: Image.asset(
                  'assets/logo.png',
                  width: 150,
                  height: 150,
                  fit: BoxFit.contain,
                ),
              ),
              const CommonHeigthContent(height: 20.0),
              Text(
                moNo,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              const CommonHeigthContent(height: 10.0),
              TextFormField(
                //autovalidate: true,
                maxLength: 10,

                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                controller: mobileController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  counterText: "",
                  hintText: 'Enter mobile no.',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Colors.grey, // Border color when focused
                      width: 1.0, // Border width when focused
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Colors.grey, // Border color
                      width: 1.0, // Border width
                    ),
                  ),
                ),
                onChanged: (value) {},
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Mobile number is required';
                  }
                  if (!mobileRegExp.hasMatch(value)) {
                    return 'Invalid mobile number';
                  }
                },
              ),
              const CommonHeigthContent(height: 20),
              CommonButton(
                text: "GET OTP",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OtpScreen()));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CommonButton extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;
  const CommonButton({Key? key, this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: appnThemeColor,
        fixedSize: Size(MediaQuery.of(context).size.width,
            50.0), // Set the width and height as needed
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(8.0), // Adjust the radius as needed
        ),
      ),
      onPressed: onPressed,
      child: Text(text ?? ""),
    );
  }
}
