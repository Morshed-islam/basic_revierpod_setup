import 'package:auto_care_vendor/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:auto_care_vendor/core/theme/dark_theme.dart';
import 'package:auto_care_vendor/core/theme/light_theme.dart';
import 'package:auto_care_vendor/logic/providers/main_riverpod_provider.dart';
import '../core/config/routes/app_routes.dart';
import '../core/constants/strings/app_constants.dart';
import '../main.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SizeConfig().init(context);
    final state = ref.watch(mainNotifierProvider);
    final themeMode = state['themeMode'] as ThemeMode;
    final locale = state['locale'] as Locale;
    
    // Override MediaQuery to prevent scaling
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
         textScaler: const TextScaler.linear(1.0), // Prevent system-wide text scaling
        //  size: const Size(375, 812),
        // textScaleFactor: 1.0, 
         
      ),
      child: MaterialApp(
        // builder: EasyLoading.init(),
        title: AppConstant.appName,
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: themeMode,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: locale,
        supportedLocales: const [
          Locale('en', ''),
          Locale('bn', ''),
        ],
        navigatorKey: navigatorKey,
        initialRoute: RouteName.splash,
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
