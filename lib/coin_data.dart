import 'dart:io';

import 'package:bitcoin_ticker/services/currency.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  CurrencyModel currency = CurrencyModel();
  Map<String, double> currentCurrencies = {};

  Future<void> getCoinData(String selectedCurrency) async {
    for (String crypto in cryptoList) {
      var coinData = await currency.get3CryptoCurrencies(crypto, selectedCurrency);
      currentCurrencies[crypto] = coinData['rate'];
      print(coinData);
      sleep(Duration(microseconds: 200));
    }
  }
}
