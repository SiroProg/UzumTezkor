import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uzum_tezkor/src/feature/profile_page/profile_page.dart';

import '../../../common/localization/app_localizations.dart';
import 'sms_code.dart';

class RegisterNumber extends StatefulWidget {
  const RegisterNumber({super.key});

  @override
  State<RegisterNumber> createState() => _RegisterNumberState();
}

class _RegisterNumberState extends State<RegisterNumber> {
  bool isValid = false;

  void validNumber(String number) {
    RegExp regex = RegExp(r'\d{9,}');
    if (regex.hasMatch(number)) {
      isValid = true;
      $profileNumber = number;
    } else {
      isValid = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Column(
            children: [
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackButton(
                    color: Colors.black,
                  ),
                  Text(
                    AppLocalizations.of(context).numPhone,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: 15),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 10),
                  child: Container(
                    height: 75,
                    decoration: const BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 12, top: 8),
                          child: Text(
                            AppLocalizations.of(context).kod,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black26,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 12, top: 8),
                          child: SizedBox(height: 30, child: Text("+998")),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Container(
                    height: 75,
                    decoration: const BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Padding(
                          padding: EdgeInsets.only(left: 12, top: 8),
                          child: Text(
                            AppLocalizations.of(context).number,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black26,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12, top: 8),
                          child: SizedBox(
                            height: 30,
                            child: TextField(
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(9),
                              ],
                              onChanged: (value) => validNumber(value),
                              keyboardType: TextInputType.number,
                              cursorColor: Colors.deepPurple,
                              decoration: const InputDecoration(
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: RichText(
                  textAlign: TextAlign.center,
                  text:  TextSpan(
                      text: AppLocalizations.of(context).uzum1,
                      style: TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(
                          text:
                          AppLocalizations.of(context).uzum2,
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                        TextSpan(
                          text: AppLocalizations.of(context).uzum3,
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextSpan(
                          text: AppLocalizations.of(context).uzum4,
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                        TextSpan(
                          text: AppLocalizations.of(context).uzum5,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ]),
                ),
              ),
              GestureDetector(
                onTap: isValid
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SmsCode(),
                          ),
                        );
                      }
                    : null,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: isValid ? Colors.deepPurple : Colors.grey,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(35),
                    ),
                  ),
                  child:  Center(
                    child: Text(
                      AppLocalizations.of(context).davom,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
