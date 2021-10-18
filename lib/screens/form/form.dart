import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../providers/providers.dart';
import '../screens.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({Key? key}) : super(key: key);
  static const route = '/';
  static const _logoAsset = 'assets/images/logo_gris.png';
  static const _websiteUrl = 'https://profesionalesdelasalud.com.co';

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
                  icon: Image.asset(_logoAsset),
                  onPressed: () async {
                    if (await canLaunch(_websiteUrl)) {
                      launch(_websiteUrl);
                    }
                  },
                ),
                const SizedBox(width: 8),
                const Text('Agenda tu cita'),
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
                      child: const SizedBox(
                          width: 32,
                          height: 32,
                          child: const CircularProgressIndicator()),
                    ),
                  ),
                )
              : const SizedBox();
        })
      ],
    );
  }
}
