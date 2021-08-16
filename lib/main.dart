import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'screens/screens.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xFF0DA3D8),
        accentColor: Color(0xFF0F9FA7),
      ),
      home: Form(),
    );
  }
}

class Form extends StatelessWidget {
  const Form({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agenda tu cita'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          print(constraints.maxWidth);
          if (constraints.maxWidth < 600) {
            return Center(
              child: Container(
                height: 50,
                width: 300,
                child: DepartmentDropdown(),
              ),
            );
          } else {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: constraints.maxWidth,
                        child: DepartmentDropdown(),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: constraints.maxWidth / 2,
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
