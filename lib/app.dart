import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/screens.dart';

class ProsaludApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agendamiento - Profesionales de la Salud',
      locale: const Locale('es', 'CO'),
      supportedLocales: const [
        Locale('es', 'CO'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      initialRoute: FormScreen.route,
      routes: {
        FormScreen.route: (context) => const FormScreen(),
      },
      theme: ThemeData(
          primarySwatch: Colors.teal,
          primaryColor: const Color(0xFF0F9FA7),
          colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: const Color(0xFF0F9FA7),
                secondary: const Color(0xFF0DA3D8),
              ),
          fontFamily: 'Montserrat',
          appBarTheme: Theme.of(context)
              .appBarTheme
              .copyWith(backgroundColor: const Color(0xFF0F9FA7))),
    );
  }
}
