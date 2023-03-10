import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:native_device_features/helpers/location_helper.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;

  Future<void> _getCurrentUserLocation() async {
    final locData = await Location().getLocation();
    final staticMapImageUrl = LocationHelper.generateLocationPreviewImage(
      latitude: locData.latitude,
      longitude: locData.longitude,
    );
    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _previewImageUrl == null
              ? Text(
                  'No Location Chosen',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: _getCurrentUserLocation,
              icon: Icon(Icons.location_on),
              label: Text(
                'Current Location',
              ),
              style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.primary),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.map),
              label: Text(
                'Select on Map',
              ),
              style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.primary),
            ),
          ],
        )
      ],
    );
  }
}
