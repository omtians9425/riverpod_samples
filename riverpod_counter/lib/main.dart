import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'Riverpod counter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

final counterProvider = StateProvider((ref) => 0);

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            // Consumer is a widget that allows you reading providers.
            // You could also use the hook "useProvider" if you uses flutter_hooks
            // Rebuild only the Text when counterProvider updates
            Consumer(builder: (context, watch, _) {
              // Listens to the value exposed by counterProvider
              final count = watch(counterProvider).state;
              return Text('$count');
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // The read method is an utility to read a provider without listening to it (typically write)
        // Similar to provider package's listen: false
        onPressed: () => context.read(counterProvider).state++,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
