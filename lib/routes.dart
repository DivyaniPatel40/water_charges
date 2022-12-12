import 'package:untitled/screens/Auth/login/login_screen.dart';
import 'package:untitled/screens/Tabs/settings/profile-edit/profile_edit_screen.dart';
import 'package:untitled/screens/Other/recipe-details/recipe_details_screen.dart';
import 'package:untitled/screens/Auth/register/register_screen.dart';
import 'package:untitled/screens/Auth/splash/splash_screen.dart';
import 'package:untitled/screens/tabs/tabs_screen.dart';
import 'package:flutter/widgets.dart';

import 'screens/Tabs/settings/languages/select_service_page.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
  EditProfileScreen.routeName: (context) => EditProfileScreen(),
  TabsScreen.routeName: (context) => TabsScreen(),
  RecipeDetailsScreen.routeName: (context) => RecipeDetailsScreen(),
  select_service_page.routeName: (context) => select_service_page(),
};
