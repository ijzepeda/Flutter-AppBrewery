import 'package:bitcoin_ticker/constants.dart';
import 'package:bitcoin_ticker/network_helper.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'coin_data.dart';
import 'coin_data.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  NetworkHelper networkHelper = NetworkHelper();
  String url;
  String selectedCurrency = 'USD';
  String selectedCripto = 'BTC';
  String rate = '?';

  Widget getOSDropdown() {
    //remove it to use a ternary
    if (Platform.isIOS) {
      return getIOSPicker();
    } else if (Platform.isAndroid) {
      return getAndroidDropDownButton();
    }
  }

  CupertinoPicker getIOSPicker() {
    List<Text> lista = [];
    for (String cur in currenciesList) {
      lista.add(Text(
        cur,
      ));
    }

    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        //callback, similar to previous
        print(selectedIndex);
        updateUI();
      },
      children: lista, // getPickerItems(),
      backgroundColor: Colors.lightBlue,
    );
  }

  DropdownButton getAndroidDropDownButton() {
    List<DropdownMenuItem<String>> lista = [];
    // for (int i = 0; i < currenciesList.length; i++) {
    // String currency = currenciesList[i];

    for (String currency in currenciesList) {
      lista.add(DropdownMenuItem(
        child: Text(currency),
        value: currency,
      ));
    }
    // return lista;
    return DropdownButton<String>(
        value: selectedCurrency,
        items: lista,
        onChanged: (value) {
          setState(() {
            print(value);
            selectedCurrency = value;
            updateUI();
          });
        });
  }

  void updateUI() {
    setState(() {
      rate = '?';
      fetchData();
    });
  }

  @override
  void initState() {
    super.initState();
    updateUI();
    // CoinData coinData = CoinData();
    // var currencyData =
    //     await coinData.getCoinData(selectedCripto, selectedCurrency);
    // print(currencyData['rate']);
    // rate = currencyData['rate'];
  }

  void fetchData() async {
    CoinData coinData = CoinData();
    var currencyData =
        await coinData.getCoinData(selectedCripto, selectedCurrency);
    print(">>>>>>>>>>>>>>");
    print(currencyData['rate']);
    double dobrate = currencyData['rate'];
    setState(() {
      rate = dobrate.toStringAsFixed(2);
    });
  }

  List<Card> createCriptoCards() {
    List<Card> lista = [];
    for (String cripto in cryptoList) {
      lista.add(Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $cripto = $rate $selectedCurrency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ));
    }
    return lista;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Column(
              children: createCriptoCards(),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getOSDropdown(), //even ternary operation ? :
          ),
        ],
      ),
    );
  }
}

/*
DropdownButton<String>(
                value: selectedCurrency,
                items: getDropDownItems(),
                onChanged: (value) {
                  setState(() {
                    print(value);
                    selectedCurrency = value;
                  });
                }),
* */
