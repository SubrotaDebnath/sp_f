import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _count = 0;

  @override
  void initState() {
    getCount();
    super.initState();
  }

  void getCount() async{
    final _prefs = await SharedPreferences.getInstance();

    setState(() {
      _count = _prefs.getInt('counter') ?? 0;
    });

  }

  void setCount()async{
    final _prefs = await SharedPreferences.getInstance();
    _prefs.setInt('counter', _count);
  }

  void _counter() {
    setState(() {
      _count++;
      setCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '$_count',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: _counter,
                  icon: Icon(
                    Icons.add,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
