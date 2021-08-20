import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../screens.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Image.network('assets/images/logo_gris.png'),
              onPressed: () async {
                if (await canLaunch('https://profesionalesdelasalud.com.co')) {
                  launch('https://profesionalesdelasalud.com.co');
                }
              },
            ),
            SizedBox(width: 8),
            Text('Agenda tu cita'),
          ],
        ),
        elevation: 0,
      ),
      body: Form(
        key: formKey,
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              return OneColumnLayout();
            } else {
              return TwoColumnLayout(
                constriants: constraints,
              );
            }
          },
        ),
      ),
    );
  }
}
