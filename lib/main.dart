import 'package:belaundry/misc/ext/string_ext.dart';
import 'package:belaundry/presentation/page/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'misc/constant.dart';
import 'misc/injector.dart';
import 'misc/login_helper.dart';
import 'presentation/page/home_page.dart';

void main() async {
  Injector.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(Constant.settingHiveTable);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme.apply(fontFamily: "Poppins");
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        textTheme: textTheme,
        primaryTextTheme: textTheme,
        useMaterial3: false,
      ),
      onGenerateRoute: (routeSettings) {
        if (routeSettings.name == "/") {
          if (LoginHelper.getTokenWithBearer().result.isNotEmptyString) {
            return MaterialPageRoute(builder: (context) => const HomePage());
          } else {
            return MaterialPageRoute(builder: (context) => const SignInPage());
          }
        }
        return null;
      },
    );
  }
}