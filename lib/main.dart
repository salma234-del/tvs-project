import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvs_app/core/global/bloc_observer/bloc_observer.dart';
import 'package:tvs_app/core/global/theme/dart_theme/app_colors_dark.dart';
import 'package:tvs_app/core/services/services_locator.dart';
import 'package:tvs_app/core/utils/app_string.dart';
import 'package:tvs_app/tvs/presentation/screens/tvs_screen.dart';

void main() {
  ServicesLocator().init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.appName,
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: AppColorsDark.background),
      home: const TvsScreen(),
    );
  }
}
