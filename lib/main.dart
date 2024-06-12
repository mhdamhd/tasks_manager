import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasksmanager/core/constants/app_constants.dart';
import 'package:tasksmanager/core/extensions/language_extensions/app_languages_extenstion.dart';
import 'package:tasksmanager/core/routes/app_routes.dart';
import 'package:tasksmanager/core/services/cache_storage_services.dart';
import 'package:tasksmanager/core/services/service_locator.dart';
import 'package:tasksmanager/core/themes/app_theme.dart';
import 'package:tasksmanager/core/translations/app_local.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tasksmanager/modules/todos/presentation/blocs/app_config_bloc/app_config_bloc.dart';
import 'generated/l10n.dart';

Future<void> main() async {
  ///todo: reject bad certificate
  WidgetsFlutterBinding.ensureInitialized();
  await CacheStorageServices.init();
  await ScreenUtil.ensureScreenSize();
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // final RemoteMessage? initialMessage;
  // late final AppController appController;
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<AppConfigBloc>(),
      child: ScreenUtilInit(
          designSize: const Size(428, 926),
          builder: (_, child) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              locale: AppLocale().currentLanguage().locale,
              title: AppConstants.applicationName,
              theme: AppTheme().lightTheme,
              darkTheme: AppTheme().lightTheme,
              routerConfig: AppRoutes.router,
            );
          }
          ),
    );
  }
}
