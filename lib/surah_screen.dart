import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SurahScreen extends StatefulWidget {
  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  late Future<List<Map<String, dynamic>>> surahData;

  @override
  void initState() {
    super.initState();
    surahData = loadSurahData();
  }

  Future<List<Map<String, dynamic>>> loadSurahData() async {
    final String jsonString =
        await rootBundle.loadString('assets/json/surah.json');
    final List<dynamic> jsonData = json.decode(jsonString);
    return jsonData.cast<Map<String, dynamic>>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Surah Screen'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: surahData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final List<Map<String, dynamic>> surahData = snapshot.data!;
            final Map<String, dynamic> selectedSurah =
                surahData[ModalRoute.of(context)!.settings.arguments as int];

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  selectedSurah['nametranslation'],
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  'Ayah Count: ${selectedSurah['ayahcount']}',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
