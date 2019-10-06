import 'package:flutter/material.dart';
import 'package:meditasyon_app/repository/user_repository.dart';
import 'package:meditasyon_app/screens/home_page.dart';

import '../models/login.dart' show UserLogin;
import '../models/register.dart';

enum AuthMode { LOGIN, REGISTER }

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  AuthMode mode;

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    mode = AuthMode.LOGIN;
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void login() async {
    bool isValid = _formKey.currentState.validate();

    if (!isValid) {
      return;
    }

    _formKey.currentState.save();

    final UserLogin userLogin = await UserRepository.login(
        _emailController.text, _passwordController.text);

    if (!userLogin.success) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(userLogin.message),
      ));
      return;
    }
    Navigator.of(context).pushReplacementNamed(HomePage.route);

  }

  void register() async{
    bool isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();

    final Register userRegister = await UserRepository.register(_emailController.text, _usernameController.text,
        _passwordController.text);

    if(!userRegister.success){
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(userRegister.message),
      ));
      return;
    }

    Navigator.of(context).pushReplacementNamed(HomePage.route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Container(
                decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                  BoxShadow(
                      color: Color(0xff441CA9),
                      offset: Offset(0, 4),
                      blurRadius: 20,
                      spreadRadius: 1),
                ]),
                child: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  radius: 60,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 50),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20,
                        offset: Offset(10, 15),
                        spreadRadius: 1),
                  ],
                ),
                width: MediaQuery.of(context).size.width * 0.70,
                height: mode == AuthMode.LOGIN
                    ? MediaQuery.of(context).size.height * 0.46
                    : MediaQuery.of(context).size.height * 0.52,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        if (mode == AuthMode.REGISTER)
                          Container(
                            height: 48,
                            child: AnimatedOpacity(
                              opacity: mode == AuthMode.REGISTER ? 1.0 : 0.0,
                              duration: Duration(milliseconds: 600),
                              child: TextFormField(
                                controller: _usernameController,
                                validator: (val) {
                                  if (val.isEmpty) {
                                    return "Lütfen bir kullanıcı adı girin";
                                  }
                                  if (val.length < 2) {
                                    return "Lütfen en az 3 karakter girin";
                                  }
                                  return null;
                                },
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (_) => FocusScope.of(context)
                                    .requestFocus(_emailFocusNode),
                                decoration: InputDecoration(
                                  hoverColor: Colors.black,
                                  labelText: "Kullanıcı Adı",
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (mode == AuthMode.REGISTER)
                          SizedBox(
                            height: 20,
                          ),
                        Container(
                          height: 48,
                          child: TextFormField(
                            controller: _emailController,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) => FocusScope.of(context)
                                .requestFocus(_passwordFocusNode),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Lütfen bir e-posta girin";
                              }
                              if (!RegExp(
                                      r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                                return "Lütfen geçerli bir eposta adresi girin";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                hoverColor: Colors.black,
                                labelText: "E-mail",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2),
                                    borderRadius: BorderRadius.circular(15))),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 48,
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            focusNode: _passwordFocusNode,
                            textInputAction: TextInputAction.done,
                            onFieldSubmitted: (_) => login(),
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return "Lütfen bir şifre girin";
                              }
                              if (val.length < 3) {
                                return "Şifreniz en az 4 karakter içermeli";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                labelText: "Şifreniz",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15))),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          height: 40,
                          width: double.infinity,
                          child: RaisedButton(
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            onPressed:
                                mode == AuthMode.LOGIN ? login : register,
                            child: Text(
                              mode == AuthMode.LOGIN ? "Giriş Yap" : "Kayıt Ol",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 40,
                          width: double.infinity,
                          child: RaisedButton(
                            onPressed: () async{
                              UserRepository.testAuth();
                            },
                            color: Colors.deepPurpleAccent,
                            child: Text(
                              "Google ile kaydol",
                              style: TextStyle(color: Colors.white),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child: Container(
                            transform:
                                Matrix4.translationValues(-15.0, 15.0, 0.0),
                            // This is required to give it negative padding
                            alignment: Alignment.centerLeft,
                            child: FlatButton(
                              onPressed: () {},
                              child: Text("Şifremi Unuttum !"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Spacer(),
              Container(
                // This is required to give it negative padding
                height: 60,
                width: MediaQuery.of(context).size.width * 0.68,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 10,
                          spreadRadius: 1,
                          offset: Offset(0, -10)),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(mode == AuthMode.LOGIN
                            ? "Kayıt Olmak İçin Tıkla"
                            : "Giriş Yapmak İçin Tıkla"),
                        margin: EdgeInsets.only(top: 15, left: 10),
                      ),
                      Spacer(),
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            if (mode == AuthMode.LOGIN) {
                              mode = AuthMode.REGISTER;
                            } else {
                              mode = AuthMode.LOGIN;
                            }
                          });
                        },
                        child: Text(
                          mode == AuthMode.LOGIN ? "Kayıt Ol" : "Giriş Yap",
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
