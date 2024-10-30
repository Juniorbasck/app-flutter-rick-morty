import 'package:flutter/material.dart';

class SettingWidget extends StatelessWidget {
  const SettingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            const SizedBox(height: 32),
            ListTile(
              title: Text(
                'External links', 
                style: Theme.of(context).
                textTheme.bodyLarge),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: const Divider(),
            ),
            ListTile(
              title: const Text('Flutter dev'),
              leading: const Icon(Icons.flutter_dash_outlined, 
              color: Colors.lightBlueAccent
              ), 
              trailing: const Icon(Icons.chevron_right),
              onTap: () => 'Flutter dev'
            ),
            
          ],
        )
      ],
    );
  }
}