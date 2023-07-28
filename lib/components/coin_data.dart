import 'dart:convert';
import 'package:http/http.dart' as http;


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

// class CoinData {}
 class CoinData {
   static const String apiKey = '581F81C2-5905-4B81-A024-4875EF0DA4F7';
   static const String apiUrl = 'http://rest.coinapi.io/v1/exchangerate';

   Future<double> getExchangeRate(String crypto, String currency) async {
     var url = '$apiUrl/$crypto/$currency?apikey=$apiKey';

     var response = await http.get(Uri.parse(url));

     if (response.statusCode == 200) {
       var data = jsonDecode(response.body);
       return data['rate'];
     } else {
       // Handle API error if needed.
       // For example, you can return a negative value to indicate an error.
       print('Failed to fetch exchange rate.');
       return -1;
     }
   }
 }