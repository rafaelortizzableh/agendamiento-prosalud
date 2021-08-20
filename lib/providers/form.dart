import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './providers.dart';
import '../services/services.dart';
import '../models/models.dart';

final selectedDepartmentProvider = StateProvider<Department?>((ref) => null);
final selectedLocalityProvider = StateProvider<Locality?>((ref) => null);
final authotizationDateProvider = StateProvider<DateTime?>((ref) => null);
final typeOfTherapyProvider = StateProvider<Therapy?>((ref) => null);
final insuranceNameProvider = StateProvider<InsuranceCompany?>((ref) => null);
final preferredScheduleProvider = StateProvider<Schedule?>((ref) => null);
final typeOfIdProvider = StateProvider<TypeOfId?>((ref) => null);
final numberOfTherapiesProvider = StateProvider<int>((ref) => 0);
final telephoneNumberProvider = StateProvider<int>((ref) => 0);
final patientAgeProvider = StateProvider<int>((ref) => 0);
final patientNameProvider = StateProvider<String>((ref) => '');
final patientDiagnosisProvider = StateProvider<String>((ref) => '');
final patientIdNumberProvider = StateProvider<String>((ref) => '');
final addressNumberProvider = StateProvider<String>((ref) => '');
final formKeyProvider =
    Provider<GlobalKey<FormState>>((ref) => GlobalKey<FormState>());

final formServiceProvider =
    Provider<FormService>((ref) => FormService(ref.watch(dioProvider)));
