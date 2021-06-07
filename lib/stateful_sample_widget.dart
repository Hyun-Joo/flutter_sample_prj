import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sample_prj/rabbit.dart';

class StatefulSampleWidget extends StatefulWidget {
  String title;
  int value;
  Rabbit rabbit;

  StatefulSampleWidget(this.title, this.value, this.rabbit);

  @override
  _StatefulSampleWidgetState createState() => _StatefulSampleWidgetState();
}

class _StatefulSampleWidgetState extends State<StatefulSampleWidget> {
  bool stateBool = false;
  @override
  void initState() {  // state의 값을 초기 설정(최초 한 번만 실행, 컨텍스트 없음)
    super.initState();
    stateBool = false;
    print("init state!");
    // 로직 추가...
    // Timer.periodic(Duration(seconds: 1), (timer){
    //   int index = timer.tick % 4;
    //   setState(() {
    //     switch(index){
    //       case 0:
    //         widget.rabbit.updateState(RabbitState.SLEEP);
    //         break;
    //       case 1:
    //         widget.rabbit.updateState(RabbitState.WALK);
    //         break;
    //       case 2:
    //         widget.rabbit.updateState(RabbitState.RUN);
    //         break;
    //       case 3:
    //         widget.rabbit.updateState(RabbitState.EAT);
    //         break;
    //     }
    //     print(widget.rabbit.state);
    //   });
    // });
  }

  // 영구적으로 삭제가 필요한 것들...(메모리 누수 방지)
  @override
  void dispose() {
    print("dispose!!!");
    super.dispose();
  }

  // 컨텍스트에 접근할 수 있는 단계
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("did change dependencies!");
    print(MediaQuery.of(context).size); // initState 단계에서 사용하면 오류 발생
  }

  // 이전 상태와 비교해서 변경이 되었는지, 변경되었다면 그에 대한 로직을 추가할 수 있음
  @override
  void didUpdateWidget(covariant StatefulSampleWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("oldWidget: ${oldWidget.value} <> this widget: ${widget.value}");
    if(oldWidget.value != widget.value){
      print("didUpdateWidget!!!");
    }
  }
  
  // 상태가 바뀔 때마다 호출
  @override
  void setState(VoidCallback fn) {
    if(mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    print("build!");
    return Scaffold(
      appBar: AppBar(title: Text("test title")),
      body: Container(
        child: Center(
            child: Text(
              widget.rabbit.state.toString(),
              style: TextStyle(fontSize: 20),
            )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            stateBool = !stateBool;
          });
        },
        child: Text("button"),
      ),
    );
  }
}