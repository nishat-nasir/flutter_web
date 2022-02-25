import 'package:flutter_redux/flutter_redux.dart';

import 'presentation/template/template.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  Locale locale = Locales().RuLocale;

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: appStore,
        child: ScreenUtilInit(
          designSize: const Size(
              ThemeSizeStyle.screenWidth, ThemeSizeStyle.screenHeight),
          builder: () => GetMaterialApp(
              builder: (context, child) => MediaQuery(
                  child: child!,
                  data:
                      MediaQuery.of(context).copyWith(textScaleFactor: 1.0.sp)),
              title: Constants.appTitle,
              debugShowCheckedModeBanner: false,
              navigatorKey: Get.key,
              initialRoute: AppRoutes.RouteToHOME_001,
              theme: MainTheme.mainThemeOrangeSimplePay,
              routes: AppRoutes.getRoutes(),
              navigatorObservers: [AppRouterObserver()],
              translations: GetLocalization(),
              locale: locale),
        ));
  }

  @override
  void initState() {
    super.initState();
    appStore.dispatch(GetDeviceInitDeviceAction);
  }
}
