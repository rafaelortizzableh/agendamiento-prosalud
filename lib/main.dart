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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        primaryColor: Color(0xFF0F9FA7),
        accentColor: Color(0xFF0DA3D8),
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
          if (constraints.maxWidth < 600) {
            return OneColumnLayout();
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

class OneColumnLayout extends StatelessWidget {
  const OneColumnLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      children: [
        NameWidget(),
        SizedBox(height: 16),
        TypeOfIdDropdown(),
        IdNumberWidget(),
        SizedBox(height: 16),
        AgeWidget(),
        SizedBox(height: 16),
        DiagnosisWidget(),
        SizedBox(height: 16),
        AddressWidget(),
        SizedBox(height: 16),
        InsuranceWidget(),
        SizedBox(height: 16),
        TelephoneWidget(),
        SizedBox(height: 16),
        DepartmentDropdown(),
        LocalityDropdown(),
        SizedBox(height: 16),
        SessionsWidget(),
        SizedBox(height: 16),
        AuthorizationDate(),
        SizedBox(height: 16),
        PreferedScheduleDropdown(),
        SizedBox(height: 16),
        SubmitButton(),
      ],
    );
  }
}
