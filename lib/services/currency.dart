import 'package:bitcoin_ticker/secret.dart';
import 'package:bitcoin_ticker/helpers/network.dart';

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';

class CurrencyModel {
  Map<String, String> customHeader = {
    'Content-type': 'application/json',
    'X-CoinAPI-Key': COINAPI_KEY,
  };
  
  // Bronze Medal
  Future<dynamic> getBTCtoUSD() async {
    NetworkHelper networkHelper = NetworkHelper('$coinAPIURL/BTC/USD');

    var currencyData = await networkHelper.getData(customHeader: customHeader);
    return currencyData;
  }

  // Silver Medal
  Future<dynamic> getBTCtoAny(String assetIdQuote) async {
    NetworkHelper networkHelper = NetworkHelper('$coinAPIURL/BTC/$assetIdQuote');

    var currencyData = await networkHelper.getData(customHeader: customHeader);
    return currencyData;
  }

  // Gold Medal
  Future<dynamic> get3CryptoCurrencies(String assetIdBase, String assetIdQuote) async {
    NetworkHelper networkHelper = NetworkHelper('$coinAPIURL/$assetIdBase/$assetIdQuote');
    
    var currencyData = await networkHelper.getData(customHeader: customHeader);
    return currencyData;
  }
}
