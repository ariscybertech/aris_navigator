import 'package:flutter/cupertino.dart';
import 'package:navigation_app/app_state.dart';

const String SplashPath = '/splash';
const String LoginPath = '/login';
const String CreateAccountPath = '/createAccount';
const String ListItemsPath = '/listItems';
const String DetailsPath = '/details';
const String CartPath = '/cart';
const String CheckoutPath = '/checkout';
const String SettingsPath = '/settings';

enum Pages {
  Splash,
  Login,
  CreateAccount,
  List,
  Details,
  Cart,
  Checkout,
  Settings
}

class PageConfiguration {
  final String key;
  final String path;
  final Pages uiPage;
  PageAction currentPageAction;
  PageConfiguration(
      {@required this.key,
      @required this.path,
      @required this.uiPage,
      this.currentPageAction});
}

PageConfiguration SplashPageConfig =
    PageConfiguration(key: 'Splash', path: SplashPath, uiPage: Pages.Splash);
PageConfiguration LoginPageConfig =
    PageConfiguration(key: 'Login', path: LoginPath, uiPage: Pages.Login);
PageConfiguration CreateAccountPageConfig = PageConfiguration(
    key: 'CreateAccount', path: CreateAccountPath, uiPage: Pages.CreateAccount);
PageConfiguration ListItemsPageConfig = PageConfiguration(
    key: 'ListItems', path: ListItemsPath, uiPage: Pages.List);
PageConfiguration DetailsPageConfig =
    PageConfiguration(key: 'Details', path: DetailsPath, uiPage: Pages.Details);
PageConfiguration CartPageConfig =
    PageConfiguration(key: 'Cart', path: CartPath, uiPage: Pages.Cart);
PageConfiguration CheckoutPageConfig = PageConfiguration(
    key: 'Checkout', path: CheckoutPath, uiPage: Pages.Checkout);
PageConfiguration SettingsPageConfig = PageConfiguration(
    key: 'Settings', path: SettingsPath, uiPage: Pages.Settings);
