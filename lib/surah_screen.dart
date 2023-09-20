// surah_screen.dart

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'models/json.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SurahScreen extends StatefulWidget {
  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  late Future<List<SurahData>> surahData;

  @override
  void initState() {
    super.initState();
    print("sosolove--loading...1");
    surahData = loadSurahData();
  }

  Future<List<SurahData>> loadSurahData() async {
    final String jsonString =
        await rootBundle.loadString('assets/json/surah.json');
    final List<dynamic> jsonData = json.decode(jsonString);
    return jsonData.map((e) => SurahData.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        backgroundColor: Colors.pink[200],
        leading: InkWell(
          onTap: () {
            Icons.add;

            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<List<SurahData>>(
        future: surahData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            // Check if the data is null.
            if (snapshot.data == null) {
              return Text('Error: Failed to load JSON data.');
            }

            final List<SurahData> surahData = snapshot.data!;
            final SurahData selectedSurah =
                surahData[ModalRoute.of(context)!.settings.arguments as int];

            // Use the null-aware operator to check if the values are null before using them.
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        selectedSurah.nameArabic?.toString() ?? 'Unknown',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 30,
                            ),
                            selectedSurah.text?.toString() ?? 'Unknown'),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
