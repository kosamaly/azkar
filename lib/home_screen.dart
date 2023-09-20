import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[200],
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/images.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 400),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/surah', arguments: 0);
                },
                child: Text(
                  '﴾سُورة ٱلۡكَهۡفِ﴿',
                  style: TextStyle(
                      color: Colors.pinkAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.black54,
                  fixedSize: Size(155, 60),
                  side: BorderSide(
                    style: BorderStyle.values[1],
                    width: 1,
                    color: Colors.pink,
                  ),
                  backgroundColor: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/surah', arguments: 1);
                },
                child: Text(
                  ' ِ﴾سُورة ٱلملك ﴿ ',
                  style: TextStyle(
                      color: Colors.pinkAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.grey,
                  fixedSize: Size(155, 60),
                  side: BorderSide(
                    style: BorderStyle.values[1],
                    width: 1,
                    color: Colors.pink,
                  ),
                  backgroundColor: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
