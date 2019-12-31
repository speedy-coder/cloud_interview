import 'package:cloud_interview/blocs/info_bloc.dart';
import 'package:cloud_interview/screens/view_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InfoCollector extends StatefulWidget {
  @override
  _InfoCollectorState createState() => _InfoCollectorState();
}

class _InfoCollectorState extends State<InfoCollector> {
  final _formKey = GlobalKey<FormState>();
  FormState _formState;
  String _name, _language;

  ///user info carrier
  Map<String, dynamic> _userInfo;

  ///validate all the data and submit data
  bool _validate() {
    _formState = _formKey.currentState;
    _formState.save();
    if (_formState.validate()) {
      return true;
    } else {
      return false;
    }
  }


  @override
  Widget build(BuildContext context) {
    final InfoBloc _bloc = Provider.of<InfoBloc>(context);

    return Scaffold(
      body: ListView(
        children: <Widget>[
          Center(
            child: Padding(
              padding: EdgeInsets.only(left: 18, right: 18, bottom: 8),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      autofocus: true,
                      decoration: InputDecoration(
                          labelText: 'Enter your name',
                          errorStyle: TextStyle(color: Colors.red)),
                      autovalidate: true,
                      validator: (validate) {
                        if (validate.isEmpty) {
                          return 'Enter your Name Please';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (captured) {
                        setState(() {
                          _name = captured;
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration:
                          InputDecoration(labelText: 'Programming Language'),
                      autovalidate: true,
                      validator: (validate) {
                        if (validate.isNotEmpty) {
                          return null;
                        } else {
                          return 'Enter your Programming Language Please';
                        }
                      },
                      onSaved: (captured) {
                        setState(() {
                          _language = captured;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      child: SizedBox(
                          width: 200, child: Center(child: Text('SAVE'))),
                      color: Colors.teal,
                      onPressed: () {
                        if (_validate()) {
                          _userInfo = {'name': _name, 'language': _language};
                          _bloc.addUserInfo(_userInfo);
                          print(_bloc.userInfo);
                          _formState.reset();
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _bloc.userInfo.isNotEmpty
                        ? RaisedButton(
                            child: SizedBox(
                                width: 200,
                                child: Center(child: Text('VIEW DATA'))),
                            color: Colors.orange,
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ViewInfo()));
                            },
                          )
                        : Container()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
