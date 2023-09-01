import 'package:flutter/material.dart';

import 'models/themeModel.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeModel>(
          create: (BuildContext context) => ThemeModel(),
        ),
      ],
      child: DevicePreview(
        enabled: false,
        builder: (context) => MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: DevicePreview.appBuilder,
      title: 'Responsive Flutter Folder Structure',
      theme: Provider.of<ThemeModel>(context).currentTheme,
      initialRoute: Routes.homeView,
      routes: Routes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
