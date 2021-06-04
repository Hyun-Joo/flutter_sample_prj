import 'package:flutter/material.dart';
import 'package:flutter_sample_prj/rabbit.dart';
import 'package:flutter_sample_prj/stateless_sample_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StatelessSampleWidget(
          "구멍이 없는 박스로 실험하는 자",
          Rabbit("개냥토끼1", RabbitState.SLEEP)
      ),
    );
  }
}
