import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/preferences/preference_config.dart';
import 'presentations/app.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey();
BuildContext get appContext => navigatorKey.currentContext!;
ThemeData appTheme([BuildContext? context]) => Theme.of(context ?? appContext);
AppLocalizations appLanguage([BuildContext? context]) => AppLocalizations.of(context ?? appContext)!;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await ScreenUtil.ensureScreenSize();
  await initPreferences();

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
