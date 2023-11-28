import 'package:flutter/material.dart';
import 'package:uzum_tezkor/src/common/localization/app_localizations.dart';

import 'determine_location.dart';

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
            Text(
              AppLocalizations.of(context).kuda,
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Text(
                AppLocalizations.of(context).razreshitDost,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
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
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DetermineLocation(),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 18),
                    child: Text(
                      AppLocalizations.of(context).opredelit,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    AppLocalizations.of(context).ukazat,
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 14,
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
