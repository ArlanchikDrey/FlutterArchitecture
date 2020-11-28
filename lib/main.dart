import 'package:architecture/notifiers/BottomNavigationNotifier.dart';
import 'package:architecture/pages/page_first.dart';
import 'package:architecture/pages/page_second.dart';
import 'package:architecture/widgets/main_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
          create: (context) => BottomNavNotifier(),
          child: HomePage()),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    BottomNavNotifier notifier = context.watch<BottomNavNotifier>();

    return Container(
      child: WillPopScope(
        onWillPop: () async => !await notifier
            .keys[notifier.selectedPage].currentState
            .maybePop(),
        child: Scaffold(
          body: IndexedStack(index: notifier.selectedPage, children: [
            Navigator(
              key: notifier.keys[0],
              onGenerateRoute: (route) => MaterialPageRoute(
                settings: route,
                builder: (context) => PageFirst(),
              ),
            ),
            Navigator(
              key: notifier.keys[1],
              onGenerateRoute: (route) => MaterialPageRoute(
                settings: route,
                builder: (context) => PageSecond(),
              ),
            ),
          ]),
          bottomNavigationBar: MainBottomNavigation(),
        ),
      ),
    );
  }
}
