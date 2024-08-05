import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'api/news/news_details_screen.dart';
import 'home_screen/home_screen.dart';
import 'my_bloc_observer.dart';
import 'my_provider.dart';
import 'my_theme.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  MyProvider provider = MyProvider();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => provider,
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.local),
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routName: (context) => HomeScreen(),
        NewsDetailsScreen.routeName: (context) => NewsDetailsScreen(),
      },
      initialRoute: HomeScreen.routName,
      theme: MyThemeData.lightTheme,
    );
  }
}
