import 'package:amazon_clone/Global%20variables%20/globalvariables.dart';
import 'package:amazon_clone/Screens/authScreen.dart';
import 'package:amazon_clone/routes/routes.dart';
import 'package:amazon_clone/services/apicachemanager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ApiCacheManager apicache = ApiCacheManager();

  Rx<bool> checkUser = true.obs;

  @override
  void initState() {
    super.initState();
    isloggin();
  }

  Future<bool> isloggin() async {
    bool isloggin = await apicache.isLoggin();
    if (isloggin) {
      // setState(() {
      //   checkUser.value = true;
      // });
      return true;
    }
    return false;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          colorScheme:
              const ColorScheme.light(primary: GlobalVariables.secondaryColor),
          appBarTheme: const AppBarTheme(
              elevation: 0, iconTheme: IconThemeData(color: Colors.black))),
      title: 'Amazon Clone',
      initialRoute:
          checkUser.value == true ? Routes.HomeScreen : Routes.AuthScreen,
      home: const AuthScreen(),
      getPages: Pages.routes,
    );
  }
}
