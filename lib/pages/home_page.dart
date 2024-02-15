import 'package:flutter/material.dart';
import 'package:go_router_sample/router/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                const Sample1PageRoute().push<void>(context);
              },
              child: const Text('Sample Page 1'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                const Sample2PageRoute().push<void>(context);
              },
              child: const Text('Sample Page 2'),
            ),
          ],
        ),
      ),
    );
  }
}
