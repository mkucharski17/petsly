import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:location/location.dart';
import 'package:open_settings/open_settings.dart';
import 'package:petsly/data/offer/offer.dart';
import 'package:petsly/features/location/location_service.dart';
import 'package:petsly/features/offers/bloc/offers_cubit.dart';
import 'package:provider/provider.dart';

class FiltersDialog extends HookWidget {
  const FiltersDialog({
    Key? key,
    required this.initialFilters,
  }) : super(key: key);

  final Filters initialFilters;

  @override
  Widget build(BuildContext context) {
    final newFilters = useState(initialFilters);
    final latLng = context.read<OffersCubit>().currentLocation;

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              children: [
                IgnorePointer(
                  ignoring: latLng == null,
                  child: Opacity(
                    opacity: latLng == null ? 0.3 : 1,
                    child: Column(
                      children: [
                        Text(
                            'Odległość od Ciebie: ${newFilters.value.range.toInt()} [km]'),
                        const SizedBox(height: 8),
                        Slider(
                          value: newFilters.value.range,
                          min: 1,
                          max: 100,
                          onChanged: (value) => newFilters.value =
                              newFilters.value.copyWith(range: value),
                        ),
                      ],
                    ),
                  ),
                ),
                if (latLng == null)
                  ElevatedButton(
                    onPressed: () async {
                      final status = await Location().hasPermission();
                      if (status == PermissionStatus.denied) {
                        await context
                            .read<LocationService>()
                            .requestPermission();
                      } else {
                        OpenSettings.openLocationSourceSetting();
                      }
                    },
                    child: const Text('Udostępnij loklizacje'),
                  )
              ],
            ),
            const SizedBox(height: 12),
            const Text('Wybrane rodzaje'),
            const SizedBox(height: 12),
            Row(
              children: [
                for (final animalType in AnimalType.values)
                  Expanded(
                    child: _AnimalTypeCheckbox(
                      animalType: animalType,
                      value: newFilters.value.types.contains(animalType),
                      onChanged: () {
                        final newList = [...newFilters.value.types];

                        if (newList.contains(animalType)) {
                          newList.remove(animalType);
                        } else {
                          newList.add(animalType);
                        }

                        newFilters.value =
                            newFilters.value.copyWith(types: newList);
                      },
                    ),
                  )
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Anuluj'),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        context.read<OffersCubit>().filter(newFilters.value);
                      },
                      child: const Text('Zapisz'),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Future<void> show(
    BuildContext context, {
    required Filters initialFilters,
  }) =>
      showDialog<String>(
        context: context,
        builder: (context) => FiltersDialog(initialFilters: initialFilters),
      );
}

class _AnimalTypeCheckbox extends HookWidget {
  const _AnimalTypeCheckbox({
    Key? key,
    required this.animalType,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final AnimalType animalType;
  final bool value;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Checkbox(
            value: value,
            onChanged: (value) => onChanged(),
          ),
          const SizedBox(width: 6),
          Text(animalType.text()),
        ],
      ),
    );
  }
}
