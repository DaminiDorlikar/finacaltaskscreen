import 'package:finacial/commonview/common_heigthconttent.dart';
import 'package:finacial/constantcontent/constant_color.dart';
import 'package:finacial/constantcontent/constant_text.dart';
import 'package:finacial/resigtaion/login.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';


class CreatMpinScreen extends StatefulWidget {
  const CreatMpinScreen({Key? key}) : super(key: key);

  @override
  State<CreatMpinScreen> createState() => _CreatMpinScreenState();
}

class _CreatMpinScreenState extends State<CreatMpinScreen> {
  OtpFieldController otpController = OtpFieldController();
  bool fieldCompleteorNot = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
              creat,
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
            const CommonHeigthContent(height: 30.0),
            OTPTextField(
              otpFieldStyle: OtpFieldStyle(
                borderColor: Colors.black,
                focusBorderColor: Colors.black,
                disabledBorderColor: Colors.black,
              ),
              outlineBorderRadius: 5.0,
              controller: otpController,
              length: 6,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 60,
              style: const TextStyle(fontSize: 17),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.box,
              onCompleted: (pin) {
                setState(() {
                  fieldCompleteorNot = true;
                });
                print("Completed: " + pin);
              },
            ),
            const CommonHeigthContent(height: 20),
            CommonButton(
              text: "SAVE",
              onPressed: () {
                fieldCompleteorNot == false
                    ? ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Please Add MPIN'),
                      ))
                    : ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('MPIn Added Sucessfully'),
                      ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
