import 'package:cloud_interview/blocs/info_bloc.dart';
import 'package:cloud_interview/screens/info_collector.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //used multiprovider incase we have many blocs
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<InfoBloc>.value(
          value: InfoBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Cloud Interview',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: InfoCollector(),
      ),
    );
  }
}
