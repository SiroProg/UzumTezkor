import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uzum_tezkor/src/common/localization/app_localizations.dart';
import 'package:uzum_tezkor/src/feature/home_page/home_page.dart';
import 'package:uzum_tezkor/src/feature/profile_page/widgets/account_exist.dart';
import 'package:uzum_tezkor/src/feature/profile_page/widgets/name_edit2.dart';

import '../profile_page.dart';
import 'name_edit1.dart';

List<String> code = [];

class SmsCode extends StatefulWidget {
  const SmsCode({super.key});

  @override
  State<SmsCode> createState() => _SmsCodeState();
}

class _SmsCodeState extends State<SmsCode> {
  late Timer? timer;
  int seconds = 60;
  late List<FocusNode> focusNodes;
  List<String> code = [];

  void startTimer() {
    timer?.cancel();
    seconds = 60;

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        seconds--;

        if (seconds == 0) {
          timer.cancel();
        }
      });
    });
  }

  @override
  void initState() {
    timer = null;
    startTimer();
    focusNodes = List.generate(4, (index) => FocusNode());
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            children: [
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackButton(
                    color: Colors.black,
                  ),
                  Text(
                    "Tasdiqlash ko'di",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: 15),
                ],
              ),
            ],
          ),
          SizedBox(
            width: 200,
            child: Row(
              children: [
                for (int i = 0; i < 4; i++)
                  CustomExpand(
                    focusNode: focusNodes[i],
                    onNext: _onNext,
                    index: i,
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: (seconds != 0)
                    ? "${$profileNumber} ${AppLocalizations.of(context).raqamiga} $seconds ${AppLocalizations.of(context).soniyadan}"
                    : AppLocalizations.of(context).qayta,
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onNext(int index) {
    if (index < focusNodes.length - 1) {
      FocusScope.of(context).requestFocus(focusNodes[index + 1]);
    }
  }
}

class CustomExpand extends StatefulWidget {
  final FocusNode focusNode;
  final Function(int) onNext;
  final int index;

  CustomExpand({
    required this.focusNode,
    required this.onNext,
    required this.index,
    super.key,
  });

  @override
  State<CustomExpand> createState() => _CustomExpandState();
}

class _CustomExpandState extends State<CustomExpand> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 2,
            ),
            child: SizedBox(
              height: 60,
              child: TextField(
                textAlign: TextAlign.center,
                focusNode: widget.focusNode,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(1),
                ],
                onChanged: (value) {
                  widget.onNext(widget.index);
                  if (value.isNotEmpty) code.add(value);

                  setState(() {});

                  if (listEquals(code, $profileNumberCode)) {
                    $profileIsExist = true;
                    code.clear();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NameEdit1(),
                      ),
                    );
                  }
                },
                keyboardType: TextInputType.number,
                cursorColor: Colors.transparent,
                decoration: const InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
