import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/screens.dart';

class ProsaludApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agendamiento - Profesionales de la salud',
      locale: Locale('es', 'CO'),
      supportedLocales: [
        Locale('es', 'CO'),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      initialRoute: FormScreen.route,
      routes: {
        FormScreen.route: (context) => FormScreen(),
      },
      theme: ThemeData(
          primarySwatch: Colors.teal,
          primaryColor: Color(0xFF0F9FA7),
          colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: Color(0xFF0F9FA7),
                secondary: Color(0xFF0DA3D8),
              ),
          fontFamily: 'Montserrat',
          appBarTheme: Theme.of(context)
              .appBarTheme
              .copyWith(backgroundColor: Color(0xFF0F9FA7))),
    );
  }
}
