import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  // @override
  final Map<int, Color> color = {
    50: Color.fromRGBO(10, 14, 33, .1),
    100: Color.fromRGBO(10, 14, 33, .2),
    200: Color.fromRGBO(10, 14, 33, .3),
    300: Color.fromRGBO(10, 14, 33, .4),
    400: Color.fromRGBO(10, 14, 33, .5),
    500: Color.fromRGBO(10, 14, 33, .6),
    600: Color.fromRGBO(10, 14, 33, .7),
    700: Color.fromRGBO(10, 14, 33, .8),
    800: Color.fromRGBO(10, 14, 33, .9),
    900: Color.fromRGBO(10, 14, 33, 1),
  };
  Widget build(BuildContext context) {
    MaterialColor colorCustom = MaterialColor(0xFF0A0E21, color);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: colorCustom,
        ).copyWith(
          secondary: Color(0xFF212747),
        ),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      home: InputPage(),
    );
  }
}
