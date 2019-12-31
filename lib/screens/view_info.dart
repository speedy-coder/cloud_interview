import 'package:cloud_interview/blocs/info_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<InfoBloc>(context);
    var list = _bloc.userInfo;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("${list[index]['name']}"),
              subtitle: Text("${list[index]['language']}"),
            );
          },
        ),
      ),
    );
  }
}
