import 'package:flutter/material.dart';

import '../../../common/localization/app_localizations.dart';
import '../../search_page/search_page.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SearchPage(),
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white70,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          child:  Row(
            children: [
              Icon(
                Icons.search,
                color: Colors.black54,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                AppLocalizations.of(context).poisk,
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
