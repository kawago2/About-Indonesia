import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'screens/wellcome_screen.dart';
import 'utils/constant.dart';
import 'utils/route.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null).then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'About Indonesia',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          toolbarHeight: 80,
          color: kPColor,
          elevation: 0,
        ),
        scaffoldBackgroundColor: kVColor,
        primaryColor: kPColor,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.black,
            ),
      ),
      initialRoute: WellcomeScreen.routeName,
      routes: routes,
    );
  }
}
