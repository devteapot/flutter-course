import 'dart:io' show Platform;

import 'package:bitcoin_ticker/coin_data.dart';
import 'package:bitcoin_ticker/crypto_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = currenciesList[0];

  Widget iOSPicker() => CupertinoPicker(
        itemExtent: 32.0,
        onSelectedItemChanged: (selectedIdex) {
          setState(() {
            selectedCurrency = currenciesList[selectedIdex];
          });
        },
        children: currenciesList
            .map(
              (e) => Text(e),
            )
            .toList(),
      );

  Widget androidPicker() => DropdownButton(
        value: selectedCurrency,
        items: currenciesList
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Text(e),
              ),
            )
            .toList(),
        onChanged: (newValue) {
          setState(() {
            selectedCurrency = newValue.toString();
          });
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: cryptoList
                .map(
                  (e) => CryptoCard(
                    cryptoName: e,
                    currencyName: selectedCurrency,
                  ),
                )
                .toList(),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOSPicker() : androidPicker(),
          ),
        ],
      ),
    );
  }
}
