import 'providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/models.dart';
import '../../services/services.dart';

final localityServiceProvider = Provider<LocalityRequestService>(
  (ref) => LocalityRequestService(ref.watch(dioProvider)),
);

final localLocalitiesListProvider = FutureProvider<List<Locality>?>(
  (ref) async {
    if (ref.watch(selectedDepartmentProvider) == null) return null;

    return await ref.watch(localityServiceProvider).getLocalitiesFromLocalJson(
          ref.watch(selectedDepartmentProvider)!,
        );
  },
);

final remoteLocalitiesListProvider = FutureProvider<List<Locality>?>(
  (ref) async {
    if (ref.watch(selectedDepartmentProvider) == null) {
      return await ref
          .watch(localityServiceProvider)
          .getLocalitiesFromDane(departments[27]);
    }

    return await ref
        .watch(localityServiceProvider)
        .getLocalitiesFromDane(ref.watch(selectedDepartmentProvider)!);
  },
);
