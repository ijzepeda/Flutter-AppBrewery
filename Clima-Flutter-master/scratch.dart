import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String x = await task2();
  task3(x);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future task2() async {
  String result = 'task 2 data';
  Duration dura = Duration(seconds: 2);
  await Future.delayed(dura, () {
    print('Task 2 complete');
    return result;
  }); //asyn method
  // sleep(dura);
  // print('Task 2 complete');
}

void task3(String data) {
  String result = 'task 3 data';
  print('Task 3 complete with $data');
}
