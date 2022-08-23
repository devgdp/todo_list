import 'package:flutter/material.dart';

import 'app_helper.dart';

abstract class RouteAwareState<T extends StatefulWidget> extends State<T>
    with RouteAware {
  @override
  void didChangeDependencies() {
    // print("didChangeDependencies $widget");

    AppHelper.routeObserver.subscribe(
        this, ModalRoute.of(context) as PageRoute); //Subscribe it here
    super.didChangeDependencies();
  }

  @override
  void didPush() {
    // print('didPush $widget');
  }

  @override
  void didPopNext() {
    // print('didPopNext $widget');
  }

  @override
  void didPop() {
    // print('didPop $widget');
  }

  @override
  void didPushNext() {
    // print('didPushNext $widget');
  }

  @override
  void dispose() {
    // print("dispose $widget");

    AppHelper.routeObserver.unsubscribe(this);
    super.dispose();
  }
}
