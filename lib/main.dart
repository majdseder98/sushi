import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi/app.dart';
import 'package:sushi/core/cashe_helper.dart';
import 'package:sushi/core/user.dart';
import 'package:sushi/firebase_options.dart';
import 'package:sushi/theme/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await CacheHelper.init;
  UserData.uid = CacheHelper.getData(key: "uid");
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const SushiApp(),
    ),
  );
}
