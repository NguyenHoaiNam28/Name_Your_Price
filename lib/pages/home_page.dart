import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 50) ),
            const Text('Phone'),
            SizedBox(
              width: 200,
              child: TextField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 20) ),
            ElevatedButton(
              onPressed: () {}, 
              child: const Text('Check'),
            )
          ],
        ),
      ),
    );
  }
}