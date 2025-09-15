import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OpenInMapsButton extends StatelessWidget {
  final double lat;
  final double lng;
  final String label;

  OpenInMapsButton({required this.lat, required this.lng, this.label = ''});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(Icons.map),
      label: Text('Open in Maps'),
      onPressed: () async {
        final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Could not open maps')),
          );
        }
      },
    );
  }
}