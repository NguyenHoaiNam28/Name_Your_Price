import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductInfo {
  final String name;
  final int price;

  ProductInfo(this.name, this.price);
}

final products = [
  ProductInfo('may tinh', 4),
  ProductInfo('Chuot', 5),
  ProductInfo('Ban phim', 6),
  ProductInfo('Tai nghe', 7),
  ProductInfo('Lot chuot', 8),
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentProductIndex = 0;
  int? _inputtedPrice;
  String _result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 50)),
            Text(products[_currentProductIndex].name),
            SizedBox(
              width: 200,
              child: TextField(
                key: const Key('priceInput'),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) {
                  _inputtedPrice = int.tryParse(value);
                },
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _result =
                      _inputtedPrice == products[_currentProductIndex].price
                          ? 'pass'
                          : 'fail';
                });
              },
              child: const Text('Check'),
            ),
            Visibility(
              visible: _result.isNotEmpty,
              child: Text(
                _result,
                key: const Key('result'),
              ),
            ),
            Visibility(
              visible: _result.isNotEmpty,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _result = '';
                    if (_currentProductIndex < 4) {
                      _currentProductIndex++;
                    }
                  });
                },
                child: const Text('Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
