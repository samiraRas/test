import 'package:checkbox/model/checkbox_model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool value = false;
  final notification = [
    CheckBoxState(title: "Messages"),
    CheckBoxState(title: "Colleagues"),
    CheckBoxState(title: "History"),
    CheckBoxState(title: "Facebook"),
  ];
  final allNotification = CheckBoxState(title: "Allow Notifications");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkbox"),
      ),
      body: Column(
        children: [
          // buildSingleCheckbox(),
          buildGroupCheckbox(allNotification),
          ...notification.map(buildSingleCheckbox).toList()
        ],
      ),
    );
  }

  Widget buildSingleCheckbox(CheckBoxState checkbox) => CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        value: checkbox.value,
        title: Text(checkbox.title),
        onChanged: (bool? value) => setState(() {
          checkbox.value = value!;
          allNotification.value =
              notification.every((element) => element.value);
        }),
      );

  tooglePressed(value) {
    if (value == null) return;
    setState(() {
      allNotification.value = value!;
      notification.forEach((element) {
        element.value = value;
      });
    });
  }

  Widget buildGroupCheckbox(CheckBoxState checkbox) => CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(checkbox.title),
      value: checkbox.value,
      onChanged: tooglePressed);
}
