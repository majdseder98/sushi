import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi/services/auth/auth_gate.dart';
import 'package:sushi/firebase_options.dart';
import 'package:sushi/models/restaurant.dart';
import 'package:sushi/theme/theme_provider.dart'; 
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => Restaurant()),
      ],
      child: SushiApp(), 
    ),
  );
}

class SushiApp extends StatefulWidget {
  const SushiApp({Key? key}) : super(key: key);

  @override
  _SushiAppState createState() => _SushiAppState();
}

class _SushiAppState extends State<SushiApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGate(), // Keeping the onTap property
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
