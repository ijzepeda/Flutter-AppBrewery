import 'constants.dart';
import 'network_helper.dart';

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
  // CoinData();
  Future<dynamic> getCoinData(
      String selectedCripto, String selectedCurrency) async {
    var url = '$baseURL/$selectedCripto/$selectedCurrency?apikey=$apikey';
    NetworkHelper networkHelper = NetworkHelper(url: url);
    var coinData = await networkHelper.getData();
    return coinData;
  }
}
