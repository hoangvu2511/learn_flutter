import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/model/authenticate.dart';
import 'package:flutter_app/model/param/login_param.dart';
import 'package:flutter_app/text_decoration.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() =>
      _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userNameController = TextEditingController(text: "map1473@gmail.com");
  final _passwordController = TextEditingController(text: "Vu01679434254");
  var _visible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login", textAlign: TextAlign.center,), centerTitle: true,),
      body: Builder(
        builder: (context) =>
            SafeArea(
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Visibility(
                    visible: _visible,
                    child: LinearProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(Colors.deepPurpleAccent)
                    ),
                    maintainAnimation: false,),
                  SizedBox(height: 80.0,),
                  Text("Welcome", textAlign: TextAlign.center,),
                  SizedBox(height: 80.0,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: CustomInputDecoration(label: USER_NAME,),
                          controller: _userNameController,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 12.0,),
                        TextField(
                          decoration: CustomInputDecoration(label: PASS, hint: HINT_PASS),
                          obscureText: true,
                          controller: _passwordController,),
                        ButtonBar(
                          children: <Widget>[
                            FlatButton(
                                child: Text("Login"),
                                onPressed: gotoNextScreen
                            )
                          ],)
                      ],
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }

  gotoNextScreen() {
    setState(() {
      _visible = !_visible;
    });
    login(LoginParam(
      username: _userNameController.text,
      password: _passwordController.text,
    )).then((value){
      setState(() {
        _visible = !_visible;
      });
    });
  }

  Future<Authenticate> login(LoginParam formLogin) async {
    var response = await http.post(
          'https://kitsu.io/api/oauth/token',
      body: formLogin.toJson(),
    );
    var map = json.decode(response.body);
    var authenticate = Authenticate.fromJson(map);
    SharedPreferences.getInstance().then((value){
      value.setString(KEY_SAVE, authenticate.access_token);
    });
    return authenticate;
  }
}
