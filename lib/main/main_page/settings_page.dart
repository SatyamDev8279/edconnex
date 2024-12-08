import 'package:flutter/material.dart';

import '../../themes/styles.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings',
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: liWhite,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Navigate to search page
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 16,
            ),
            const Divider(
              color: liMediumGrey,
            ),
            _settingsSection(
              context,
              title: 'Account preferences',
              subtitle:
                  'Options for managing your account and experience on LinkedIn',
              icon: Icons.person,
              onTap: () {
                // Navigate to Account preferences page
              },
            ),
            const SizedBox(
              height: 16,
            ),
            const Divider(
              color: liMediumGrey,
            ),
            _settingsSection(
              context,
              title: 'Sign in & security',
              subtitle:
                  'Options and controls for signing in and keeping your account safe',
              icon: Icons.lock,
              onTap: () {
                // Navigate to Sign in & security page
              },
            ),
            const SizedBox(
              height: 16,
            ),
            const Divider(
              color: liMediumGrey,
            ),
            _settingsSection(
              context,
              title: 'Visibility',
              subtitle:
                  'Control who sees your activity and information on LinkedIn',
              icon: Icons.visibility,
              onTap: () {
                // Navigate to Visibility page
              },
            ),
            const SizedBox(
              height: 16,
            ),
            const Divider(
              color: liMediumGrey,
            ),
            _settingsSection(
              context,
              title: 'Communications',
              subtitle: 'Controls for emails, invites, and notifications',
              icon: Icons.email,
              onTap: () {
                // Navigate to Communications page
              },
            ),
            const SizedBox(
              height: 16,
            ),
            const Divider(
              color: liMediumGrey,
            ),
            _settingsSection(
              context,
              title: 'Data privacy',
              subtitle:
                  'Control how LinkedIn uses your information for general site use and job seeking',
              icon: Icons.security,
              onTap: () {
                // Navigate to Data privacy page
              },
            ),
            const SizedBox(
              height: 16,
            ),
            const Divider(
              color: liMediumGrey,
            ),
          ],
        ),
      ),
    );
  }

  Widget _settingsSection(BuildContext context,
      {required String title,
      required String subtitle,
      required IconData icon,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}
