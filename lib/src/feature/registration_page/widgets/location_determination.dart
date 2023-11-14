import 'package:flutter/material.dart';

class LocationDetermination extends StatelessWidget {
  const LocationDetermination({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(
              width: 360,
              height: 360,
              fit: BoxFit.cover,
              image: AssetImage("asset/icons/checking_the_location.png"),
            ),
            const Text(
              "Куда доставить?",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
              child: Text(
                "Разрешите доступ к местоположению или укажите адрес вручнуюб чтобы мы подобрали лучшие рестораны поблизости",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 18),
                    child: Text(
                      "Определить автоматически",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Указать вручную",
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
