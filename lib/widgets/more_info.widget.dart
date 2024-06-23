import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreInfo extends StatelessWidget {
  final List<Map<String, String?>> icons;
  const MoreInfo({super.key, required this.icons});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 10,
      spacing: 10,
      alignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: icons
          .where((item) => item['url'] != null && item['url']!.isNotEmpty)
          .map((item) => IconButton(
                onPressed: () {
                  launchUrl(Uri.parse(item['url']!));
                },
                icon: FadeInImage(
                  image: NetworkImage(item['icon']!),
                  placeholder: const AssetImage('assets/images/loading.gif'),
                  fit: BoxFit.scaleDown,
                  height: 50,
                ),
              ))
          .toList(),
    );
  }
}
