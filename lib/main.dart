import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/provider/recipes_view_provider.dart';
import 'package:meals_app/utill/app_constants.dart';
import 'package:meals_app/view/screen/recipe_view_screen.dart';
import 'package:provider/provider.dart';
import 'di_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  await di.init();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => di.sl<RecipesViewProvider>()),
    ], child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

    return ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: AppConstants.appName,
              theme: ThemeData(),
              home: RecipeViewScreen(),
          );
        });
  }
}
