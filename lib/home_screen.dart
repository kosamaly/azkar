import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/images.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/surah', arguments: 0);
                },
                child: Text('سورة تبارك'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/surah', arguments: 1);
                },
                child: Text('elkahf'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
