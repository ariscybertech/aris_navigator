import 'dart:async';

import 'package:flutter/material.dart';
import 'package:navigation_app/router/back_dispatcher.dart';
import 'package:navigation_app/router/router_delegate.dart';
import 'package:navigation_app/router/shopping_parser.dart';
import 'package:navigation_app/router/ui_pages.dart';
import 'package:provider/provider.dart';
import 'package:uni_links/uni_links.dart';

import 'app_state.dart';
import 'ui/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final appState = AppState();

  ShoppingRouterDelegate delegate;
  final parser = ShoppingParser();
  ShoppingBackButtonDispatcher backButtonDispatcher;
  StreamSubscription _linkSubscription;

  // TODO Add Subscription

  _MyAppState() {
// 1
    delegate = ShoppingRouterDelegate(appState);
// 2
    delegate.setNewRoutePath(SplashPageConfig);
    backButtonDispatcher = ShoppingBackButtonDispatcher(delegate);
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  @override
  void dispose() {
    _linkSubscription?.cancel();
    super.dispose();
  }

// Platform messages are asynchronous, so declare them with the async keyword.
  Future<void> initPlatformState() async {
    // Attach a listener to the Uri links stream
// 1
    _linkSubscription = getUriLinksStream().listen((Uri uri) {
      if (!mounted) return;
      setState(() {
// 2
        delegate.parseRoute(uri);
      });
    }, onError: (Object err) {
      print('Got error $err');
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO Add Router
    return ChangeNotifierProvider<AppState>(
      create: (_) => appState,
      child: MaterialApp.router(
        title: 'Navigation App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        backButtonDispatcher: backButtonDispatcher,
        routerDelegate: delegate,
        routeInformationParser: parser,
      ),
    );
  }
}
