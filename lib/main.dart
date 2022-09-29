import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:one_context/one_context.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _router = GoRouter(routes: [
    GoRoute(
      path: '/',
      name: 'screenone',
      builder: (context, state) => const ScreenOne(),
    ),
    GoRoute(
      path: '/screen-two',
      name: 'screentwo',
      builder: (context, state) => const ScreenTwo(),
    ),
  ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Web OneContext Navigation bug',
      routerConfig: _router,
      builder: (context, child) => OneContext().builder(context, child),
    );
  }
}

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: const Text('Screen One'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You are on Screen One',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => context.pushNamed('screentwo'),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Go To Screen Two'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text('Screen Two'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You are on Screen Two,\nNow try browser back button',
              style: Theme.of(context).textTheme.displaySmall,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => context.pushNamed('screenone'),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Go To Screen One'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
