import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uzum_tezkor/src/common/model/person_model.dart';
import 'package:uzum_tezkor/src/feature/home_page/home_page.dart';
import 'package:uzum_tezkor/src/feature/profile_page/profile_page.dart';

import '../../../common/localization/app_localizations.dart';
import '../../../common/provider/client_state_notifier.dart';
import '../../home_page/widgets/restaurants.dart';

class NameEdit1 extends ConsumerStatefulWidget {
  const NameEdit1({super.key});

  @override
  ConsumerState<NameEdit1> createState() => _RegisterNumberState();
}

class _RegisterNumberState extends ConsumerState<NameEdit1> {
  bool isValid = false;
  String? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const BackButton(
                    color: Colors.black,
                  ),
                  Text(
                    AppLocalizations.of(context).persInfo,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(width: 15),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 12, right: 12, top: 20, bottom: 8),
                height: 63,
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
                      padding: const EdgeInsets.only(left: 12, top: 8),
                      child: Text(
                        AppLocalizations.of(context).name,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.black26,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12, top: 8),
                      child: SizedBox(
                        height: 28,
                        child: TextField(
                          onChanged: (value) {
                            // Remove leading and trailing spaces and check if the modified string is not empty
                            if (value.trim().isNotEmpty) {
                              isValid = true;
                              name = value;
                            } else {
                              isValid = false;
                            }
                            setState(() {});
                          },
                          keyboardType: TextInputType.name,
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
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  AppLocalizations.of(context).kakUmer,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.black26,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 12, right: 12, top: 35, bottom: 8),
                height: 63,
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
                      padding: const EdgeInsets.only(left: 12, top: 8),
                      child: Text(
                        AppLocalizations.of(context).number,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.black26,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12, top: 12),
                      child: SizedBox(
                        height: 26,
                        child: TextField(
                          enabled: false,
                          keyboardType: TextInputType.name,
                          cursorColor: Colors.deepPurple,
                          decoration: InputDecoration(
                            hintText: "+${$profileNumber}",
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Text(
                  AppLocalizations.of(context).chtobi,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.black26,
                  ),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: isValid
                ? () {
                    setState(() {});
                    ref.read(clientProvider.notifier).pageNumber.value = 0;

                    ref.read(clientProvider.notifier).pageController.jumpToPage(
                          0,
                        );
                    $profileName.value = name!;
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                      (route) => false,
                    );
                    ref.read(clientProvider.notifier).registerPerson(
                          PersonModel(
                            id: 3123,
                            name: $profileName.value,
                            phoneNumber: $profileNumber,
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
              child: Center(
                child: Text(
                  AppLocalizations.of(context).soxranit,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
