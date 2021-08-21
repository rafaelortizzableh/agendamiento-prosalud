import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../providers/providers.dart';
import '../screens.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Image.asset('assets/images/logo_gris.png'),
                  onPressed: () async {
                    if (await canLaunch(
                        'https://profesionalesdelasalud.com.co')) {
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
        ),
        Consumer(builder: (context, watch, _) {
          return watch(isLoadingProvider).state
              ? Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black.withOpacity(0.5),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.75),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: SizedBox(
                          width: 32,
                          height: 32,
                          child: CircularProgressIndicator()),
                    ),
                  ),
                )
              : SizedBox();
        })
      ],
    );
  }
}
