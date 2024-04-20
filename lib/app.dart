import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sushi/cubit/home_cubit.dart';
import 'package:sushi/services/auth/auth_gate.dart';
import 'package:sushi/theme/theme_provider.dart';

class SushiApp extends StatelessWidget {
  const SushiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getFood(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const AuthGate(),
        theme: Provider.of<ThemeProvider>(context).themeData,
      ),
    );
  }
}
