import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../providers/providers.dart';
import '../screens.dart';

const _logoAsset = 'assets/images/logo_gris.png';
const _websiteUrl = 'https://profesionalesdelasalud.com.co';
const _copyWritingText = 'Agenda tu cita';
const _padding32 = 32.0;
const _padding16 = 16.0;
const _padding8 = 8.0;
const _mobileMaxWidth = 600.0;
const _elevation0 = 0.0;
const _opacity05 = 0.5;
const _opacity075 = 0.75;

class FormScreen extends StatelessWidget {
  const FormScreen({Key? key}) : super(key: key);
  static const route = '/';

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
                    if (await canLaunchUrlString(_websiteUrl)) {
                      launchUrlString(_websiteUrl);
                    }
                  },
                ),
                const SizedBox(width: _padding8),
                const Text(_copyWritingText),
              ],
            ),
            elevation: _elevation0,
          ),
          body: Form(
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < _mobileMaxWidth) {
                  return const OneColumnLayout();
                } else {
                  return TwoColumnLayout(
                    constriants: constraints,
                  );
                }
              },
            ),
          ),
        ),
        Consumer(
          builder: (context, ref, _) {
            return ref.watch(isLoadingProvider)
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black.withOpacity(_opacity05),
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(_opacity075),
                        ),
                        padding: const EdgeInsets.all(_padding16),
                        child: const SizedBox(
                            width: _padding32,
                            height: _padding32,
                            child: CircularProgressIndicator()),
                      ),
                    ),
                  )
                : const SizedBox();
          },
        ),
      ],
    );
  }
}
