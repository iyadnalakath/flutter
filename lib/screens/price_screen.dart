// import 'dart:ffi';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:dice/components/coin_data.dart';
// import 'dart:io' show Platform;
//
//
// class PriceScreen extends StatefulWidget {
//   @override
//   _PriceScreenState createState() => _PriceScreenState();
// }
//
// class _PriceScreenState extends State<PriceScreen> {
//   String selectedCurrency = 'USD';
//
//   DropdownButton<String> androidDropdown() {
//
//     List<DropdownMenuItem<String>> dropdownItems = [];
//     for (String currency in currenciesList) {
//       var newItem = DropdownMenuItem(
//         child: Text(currency),
//         value: currency,
//       );
//       dropdownItems.add(newItem);
//     }
//
//     return DropdownButton<String>(
//       value: selectedCurrency,
//       items: dropdownItems,
//       onChanged: (value) {
//         setState(() {
//           selectedCurrency = value!;
//         });
//       },
//     );
//   }
//
//   // List<DropdownMenuItem<String>> getDropdownItems() {
//   //
//   // }
//
//   CupertinoPicker iOSPicker(){
//
//     List<Widget> pickerItems = [];
//     for (String currency in currenciesList) {
//       pickerItems.add(
//         Text(
//           currency,
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 20.0,
//           ),
//         ),
//       );
//     }
//
//
//     return CupertinoPicker(
//       backgroundColor: Colors.lightBlue,
//       itemExtent: 32.0,
//       onSelectedItemChanged: (int selectedIndex) {
//         // Your code here
//       },
//       children: pickerItems, // Call the function here
//     );
//   }
//
//   // List<Widget> getPickerItems(){
//   //
//   // }
//
//   Widget getPicker() {
//     if (Platform.isIOS) {
//       return iOSPicker();
//     } else if (Platform.isAndroid) {
//       return androidDropdown();
//     }
//     return Container(); // Return an empty container or null in case none of the platforms match.
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('🤑 Coin Ticker'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           Padding(
//             padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
//             child: Card(
//               color: Colors.lightBlueAccent,
//               elevation: 5.0,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
//                 child: Text(
//                   '1 BTC = ? USD',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 20.0,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             height: 150.0,
//             alignment: Alignment.center,
//             padding: EdgeInsets.only(bottom: 30.0),
//             color: Colors.lightBlue,
//             child:Platform.isIOS ? iOSPicker() : androidDropdown(),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
// // http://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=581F81C2-5905-4B81-A024-4875EF0DA4F7
//
//

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dice/components/coin_data.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  double exchangeRate = 0.0;

  CoinData coinData = CoinData();

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }
    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value!;
          getExchangeRate(selectedCurrency);
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Widget> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(
        Text(
          currency,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      );
    }
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (int selectedIndex) {
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
          getExchangeRate(selectedCurrency);
        });
      },
      children: pickerItems,
    );
  }

  Future<void> getExchangeRate(String currency) async {
    double rate = await coinData.getExchangeRate('BTC', currency);
    setState(() {
      exchangeRate = rate;
    });
  }

  Widget getPicker() {
    if (Platform.isIOS) {
      return iOSPicker();
    } else if (Platform.isAndroid) {
      return androidDropdown();
    }
    return Container(); // Return an empty container or null in case none of the platforms match.
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
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ${exchangeRate.toStringAsFixed(2)} $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

          ),
          Container(

            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getPicker(),
          ),
        ],
      ),
    );
  }
}
