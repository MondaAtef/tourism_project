import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:vixor_project/cubit/bloc%20observer.dart';
import 'package:vixor_project/cubit/bloc.dart';
import 'package:vixor_project/cubit/cashe%20helper.dart';
import 'package:vixor_project/cubit/dio%20helper.dart';
import 'package:vixor_project/provider/PlaceProvider.dart';

import 'package:vixor_project/provider/homeprovider.dart';
import 'package:vixor_project/provider/theme_provider.dart';
import 'package:vixor_project/provider/view%20provider.dart';
import 'package:vixor_project/provider/wishlist_provider.dart';
import 'package:vixor_project/screens/chat_screen/chat_screen.dart';
import 'package:vixor_project/screens/dashboard_screen/details.dart';
import 'package:vixor_project/screens/dashboard_screen/widgets/product_details.dart';
import 'package:vixor_project/screens/dashboard_screen/widgets/viewed_recently.dart';
import 'package:vixor_project/screens/dashboard_screen/widgets/wishlist.dart';
import 'package:vixor_project/screens/localization/changelocal.dart';
import 'package:vixor_project/screens/localization/localization.dart';
import 'package:vixor_project/screens/localization/services.dart';
import 'package:vixor_project/screens/splash.dart';

import 'screens/dashboard_screen/widgets/searchscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  Gemini.init(apiKey: GEMINI_API_KEY);
  // ignore: deprecated_member_use
  BlocOverrides.runZoned(
    () async {
      await CachHelper.init();
      DioHelper.init();
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeProvider themeChangeProvider = ThemeProvider();

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  //Fetch the current theme
  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePreferences.getTheme();
  }

  final Future<FirebaseApp> firebaseinitilization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebaseinitilization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(child: CircularProgressIndicator()),
              ),
            );
          } else if (snapshot.hasError) {
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(
                  child: Text('An Error occurred'),
                ),
              ),
            );
          }

          return MultiProvider(
            providers: [
              BlocProvider(
                create: (BuildContext context) => NewsCubit()..getUserData(),
              ),
              ChangeNotifierProvider(create: (_) {
                //Notify about theme changes
                return themeChangeProvider;
              }),
              ChangeNotifierProvider(create: (_) {
                return WishlistProvider();
              }),
              ChangeNotifierProvider(create: (_) {
                return ViewedProdProvider();
              }),
              /*  ChangeNotifierProvider(create: (_) {
                return TripProvider();
              }),*/

              ChangeNotifierProvider(create: (_) {
                return PlaceProvider();
              }),
              ChangeNotifierProvider(create: (_) {
                return HomeProvider();
              }),
            ],
            child: Consumer<ThemeProvider>(
                builder: (context, themeChangeProvider, ch) {
              LocaleController controller = Get.put(LocaleController());
              return GetMaterialApp(
                translations: MyTranslation(),
                debugShowCheckedModeBanner: false,
                locale: controller.language,
                routes: {
                  ViewedRecentlyScreen.routName: (context) =>
                      const ViewedRecentlyScreen(),
                  SearchScreen.routeName: (context) => const SearchScreen(),
                  ProductDetailsScreen.routName: (context) =>
                      const ProductDetailsScreen(),
                  WishlistScreen.routName: (context) => const WishlistScreen(),
                  PlaceDetailScreen.routeName: (context) => PlaceDetailScreen(),
                },
                title: 'Luxor app',
                home: const Splash(),
              );
            }),
          );
        });
  }
}
