import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

const apiKey = 'lol';

class CryptoCard extends StatefulWidget {
  const CryptoCard({
    Key? key,
    required this.cryptoName,
    required this.currencyName,
  }) : super(key: key);

  final String cryptoName;
  final String currencyName;

  @override
  State<CryptoCard> createState() => _CryptoCardState();
}

class _CryptoCardState extends State<CryptoCard> {
  double? rate;

  getCoinData(String from, String to) async {
    final double initialRate = await get(
      Uri.https(
        'rest.coinapi.io',
        '/v1/exchangerate/$from/$to',
        {'apiKey': apiKey},
      ),
    ).then((value) => jsonDecode(value.body)['rate']);

    setState(() {
      rate = initialRate;
    });
  }

  @override
  void initState() {
    super.initState();
    getCoinData(widget.cryptoName, widget.currencyName);
  }

  @override
  void didUpdateWidget(covariant CryptoCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    getCoinData(widget.cryptoName, widget.currencyName);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 ${widget.cryptoName} = ${rate?.toStringAsFixed(2) ?? "Loading..."} ${widget.currencyName}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
