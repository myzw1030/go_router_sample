import 'package:flutter/material.dart';

class Sample2Page extends StatelessWidget {
  const Sample2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Page 2'),
      ),
      body: const SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Sample Page 2',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
