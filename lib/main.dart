import 'package:apex_dmit/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import 'core/di/model_registry.dart';
import 'core/di/vm_registry.dart';

GetIt getIt = GetIt.instance;

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    setupVMLocator();
    setupModelLocator();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));


    return MaterialApp(
      title: 'APEX DMIT',
      initialRoute: '/',
      routes: defaultRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter', // Custom Font Apply
      ),
    );
  }
}