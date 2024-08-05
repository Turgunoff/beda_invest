import 'package:beda_invest/src/app.dart';
import 'package:beda_invest/presentation/pages/drawers/switch_languages.dart';
import 'package:beda_invest/domain/controllers/settings_controller.dart';
import 'package:beda_invest/data/services/settings_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:beda_invest/presentation/pages/login/phone.dart'; // Import your phone.dart file
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Import your generated localizations

class AppDrawer extends StatelessWidget {
  final bool isLoggedIn;

  AppDrawer({required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    // Set up the SettingsController, which will glue user settings to multiple
    // Flutter Widgets.
    final settingsController = SettingsController(SettingsService());

    // Load the user's preferred theme while the splash screen is displayed.
    // This prevents a sudden theme change when the app is first displayed.
    settingsController.loadSettings();
    return Drawer(
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  ),
                  child: const Flex(
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'beda.',
                                style: TextStyle(
                                    fontSize: 55.0,
                                    fontWeight: FontWeight.w900),
                              ),
                              Text(
                                'Drawer',
                                style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (user != null)
                  ListTile(
                    leading: Icon(
                      Icons.account_circle_outlined,
                      size: 30.0,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    title: Text(
                      AppLocalizations.of(context)!.profile,
                      style: const TextStyle(fontSize: 20.0),
                    ),
                    onTap: () {
                      // Navigator.push(
                      // context,
                      // MaterialPageRoute(
                      //     builder: (context) => ProfilePage()));
                    },
                  ),
                if (user != null)
                  ListTile(
                    leading: Icon(
                      Icons.store_mall_directory_rounded,
                      size: 30.0,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    title: Text(
                      AppLocalizations.of(context)!.myProperties,
                      style: const TextStyle(fontSize: 20.0),
                    ),
                    onTap: () {
                      // Implement the logic to navigate to the bookmarks page.
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => MyPropertiesView()),
                      // ); // Close the drawer after navigation.
                    },
                  ),
                if (user != null)
                  ListTile(
                    leading: Icon(
                      Icons.bookmark_border_outlined,
                      size: 30.0,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    title: Text(
                      AppLocalizations.of(context)!.bookmarks,
                      style: const TextStyle(fontSize: 20.0),
                    ),
                    onTap: () {
                      // Implement the logic to navigate to the bookmarks page.
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => BookmarksView()),
                      // ); // Close the drawer after navigation.
                    },
                  ),
                ListTile(
                  leading: Icon(
                    Icons.settings_outlined,
                    size: 30.0,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  title: Text(
                    AppLocalizations.of(context)!.settings,
                    style: TextStyle(fontSize: 20.0),
                  ),
                  onTap: () {
                    // Implement the logic to navigate to the settings page.
                    Navigator.pop(
                        context); // Close the drawer after navigation.
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.language,
                    size: 30.0,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  title: Text(
                    AppLocalizations.of(context)!.switchLanguages,
                    style: TextStyle(fontSize: 20.0),
                  ),
                  onTap: () {
                    // Implement the logic to switch the language.
                    // Example: ChangeLocale.of(context).change('uz');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SwitchLanguages(
                                settingsController: settingsController,
                              )),
                    ); // Close the drawer after navigation.
                  },
                ),
                ListTile(
                  leading: Icon(
                    user == null ? Icons.login : Icons.logout,
                    size: 30.0,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  title: Text(
                    user == null
                        ? AppLocalizations.of(context)!.login
                        : AppLocalizations.of(context)!.logout,
                    style: TextStyle(fontSize: 20.0),
                  ),
                  onTap: () async {
                    // Implement the logic to navigate to the login page.
                    Future.delayed(Duration.zero, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyPhone(),
                        ),
                      );
                    }); // Close the drawer after navigation.
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
