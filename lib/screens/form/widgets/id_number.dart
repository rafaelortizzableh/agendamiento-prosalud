import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/models.dart';
import '../../../providers/providers.dart';

class IdNumberWidget extends ConsumerStatefulWidget {
  const IdNumberWidget({Key? key, required this.isTwoColumn}) : super(key: key);
  final bool isTwoColumn;

  @override
  ConsumerState<IdNumberWidget> createState() => _IdNumberWidgetState();
}

class _IdNumberWidgetState extends ConsumerState<IdNumberWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController.fromValue(
      TextEditingValue(
        text: ref.read(patientIdNumberProvider),
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      TypeOfId? typeOfId = ref.watch(typeOfIdProvider);
      if (typeOfId != null) {
        return !widget.isTwoColumn
            ? Column(
                children: [
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _controller,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => value != null && value.length > 15
                        ? 'Máximo 15 caracteres'
                        : null,
                    onChanged: (value) => ref
                        .read(patientIdNumberProvider.notifier)
                        .state = value,
                    keyboardType: typeOfId.id != 5
                        ? TextInputType.number
                        : TextInputType.text,
                    textInputAction: TextInputAction.next,
                    inputFormatters: typeOfId.id != 5
                        ? [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ]
                        : [],
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15.0),
                      labelText: 'Número de identidad*',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                ],
              )
            : Row(
                children: [
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      controller: _controller,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value != null && value.length > 15
                          ? 'Máximo 15 caracteres'
                          : null,
                      onChanged: (value) => ref
                          .read(patientIdNumberProvider.notifier)
                          .state = value,
                      keyboardType: typeOfId.id != 5
                          ? TextInputType.number
                          : TextInputType.text,
                      textInputAction: TextInputAction.next,
                      inputFormatters: typeOfId.id != 5
                          ? [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ]
                          : [],
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 15.0),
                        labelText: 'Número de identidad*',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  ),
                ],
              );
      } else {
        return const SizedBox();
      }
    });
  }
}
