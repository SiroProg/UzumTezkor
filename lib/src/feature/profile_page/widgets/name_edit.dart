import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uzum_tezkor/src/feature/home_page/home_page.dart';
import 'package:uzum_tezkor/src/feature/profile_page/profile_page.dart';

class NameEdit extends StatefulWidget {
  const NameEdit({super.key});

  @override
  State<NameEdit> createState() => _RegisterNumberState();
}

class _RegisterNumberState extends State<NameEdit> {
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackButton(
                    color: Colors.black,
                  ),
                  Text(
                    "Shaxsiy ma'lumot",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: 15),
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
                    const Padding(
                      padding: EdgeInsets.only(left: 12, top: 8),
                      child: Text(
                        "Ism",
                        style: TextStyle(
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
                            if (value != $profileName) {
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
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "Sizga kuryer qanday murojaat qilsa bo'ladi",
                  style: TextStyle(
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
                    const Padding(
                      padding: EdgeInsets.only(left: 12, top: 8),
                      child: Text(
                        "Raqam",
                        style: TextStyle(
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
              const Padding(
                padding: EdgeInsets.only(left: 14),
                child: Text(
                  "Telefon raqamini almashtirish uchun",
                  style: TextStyle(
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
                    $profileName = name!;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
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
              child: const Center(
                child: Text(
                  "Saqlash",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
