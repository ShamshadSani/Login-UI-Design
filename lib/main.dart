import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: LoginPage(),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _pageState = 0;
  var _backgroundColor = Colors.white;
  var _headingColor = Colors.white;

  double _heading_top = 100;
  double loginHeight = 0;
  double registerHeight = 0;

  double loginOpacity = 1;
  double loginWidth = 0;
  double loginYoffset = 0;
  double loginXoffset = 0;
  double registerYoffset = 0;

  double windowWidth = 0;
  double windowHeight = 0;
  bool _keyboardVisilble = false;
  @override
  void initState() {
    super.initState();
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          _keyboardVisilble = visible;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;
    loginHeight = windowHeight - 270;
    registerHeight = windowHeight - 270;
    switch (_pageState) {
      case 0:
        _backgroundColor = Colors.white;
        _headingColor = Colors.purple;
        loginYoffset = windowHeight;
        loginXoffset = 0;
        loginOpacity = 1;
        _heading_top = 100;
        loginWidth = windowWidth;
        loginHeight = _keyboardVisilble ? windowHeight : windowHeight - 270;
        registerYoffset = windowHeight;
        break;
      case 1:
        _backgroundColor = Colors.pink;
        _headingColor = Colors.white;
        loginYoffset = _keyboardVisilble ? 40 : 270;
        loginHeight = _keyboardVisilble ? windowHeight : windowHeight - 270;
        loginXoffset = 0;
        _heading_top = 90;
        loginOpacity = 1;
        loginWidth = windowWidth;
        registerYoffset = windowHeight;
        break;
      case 2:
        _backgroundColor = Colors.pink;
        _headingColor = Colors.white;
        loginYoffset = 240;
        loginXoffset = 20;
        _heading_top = 80;
        loginOpacity = 0.7;
        loginYoffset = _keyboardVisilble ? 30 : 240;
        loginHeight = _keyboardVisilble ? windowHeight : windowHeight - 240;
        loginWidth = windowWidth - 40;
        registerYoffset = _keyboardVisilble ? 55 : 270;
        registerHeight = _keyboardVisilble ? windowHeight : windowHeight - 240;
        break;
    }

    return SingleChildScrollView(
      child: Stack(
        children: [
          AnimatedContainer(
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(microseconds: 1000),
            color: _backgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _pageState = 0;
                    });
                  },
                  child: Container(
                    child: Column(
                      children: [
                        AnimatedContainer(
                            curve: Curves.fastLinearToSlowEaseIn,
                            duration: Duration(milliseconds: 1000),
                            margin: EdgeInsets.only(top: _heading_top),
                            child: Text(
                              'Learn Free',
                              style:
                              TextStyle(color: _headingColor, fontSize: 28),
                            )),
                        Container(
                          margin: EdgeInsets.all(20),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'We make learning easy.Androi studio to learn flutter for bigner and advance level student.',
                            style: TextStyle(
                              color: _headingColor,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Center(
                    child: Image.asset('assets/images/splash_bg.png'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(28),
                  padding: EdgeInsets.all(20),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_pageState != 0) {
                          _pageState = 0;
                        } else {
                          _pageState = 1;
                        }
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          AnimatedContainer(
            padding: EdgeInsets.all(32),
            width: loginWidth,
            height: loginHeight,
            duration: Duration(milliseconds: 1000),
            curve: Curves.fastLinearToSlowEaseIn,
            transform: Matrix4.translationValues(loginXoffset, loginYoffset, 1),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(loginOpacity),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Text(
                        'Login To Continue',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    InputWithIcon(
                      icon: Icons.email,
                      hint: 'Enter Email ....',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InputWithIcon(
                      icon: Icons.vpn_key,
                      hint: 'Enter Password ....',
                    ),
                  ],
                ),
                Column(
                  children: [
                    PrimaryButton(
                      btnText: 'Login',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _pageState = 2;
                        });
                      },
                      child: OutlinceButton(
                        btnText: 'Create New Account',
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          AnimatedContainer(
            height: registerHeight,
            padding: EdgeInsets.all(32),
            duration: Duration(milliseconds: 1000),
            curve: Curves.fastLinearToSlowEaseIn,
            transform: Matrix4.translationValues(0, registerYoffset, 1),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Text(
                        'Create a New Account',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    InputWithIcon(
                      icon: Icons.email,
                      hint: 'Enter Email ....',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InputWithIcon(
                      icon: Icons.vpn_key,
                      hint: 'Enter Password ....',
                    ),
                  ],
                ),
                Column(
                  children: [
                    PrimaryButton(
                      btnText: 'Create Account',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _pageState = 1;
                        });
                      },
                      child: OutlinceButton(
                        btnText: 'Back To Login',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PrimaryButton extends StatefulWidget {
  final String btnText;
  PrimaryButton({this.btnText});
  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.purple, borderRadius: BorderRadius.circular(50)),
      padding: EdgeInsets.all(20),
      child: (Center(
        child: Text(
          widget.btnText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      )),
    );
  }
}

class InputWithIcon extends StatefulWidget {
  final IconData icon;
  final String hint;
  InputWithIcon({this.icon, this.hint});

  @override
  _InputWithIconState createState() => _InputWithIconState();
}

class _InputWithIconState extends State<InputWithIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.purple, width: 2),
          borderRadius: BorderRadius.circular(50)),
      child: Row(
        children: [
          Container(
              width: 60,
              child: Icon(
                widget.icon,
                color: Colors.grey,
                size: 20,
              )),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  hintText: widget.hint,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 20)),
            ),
          ),
        ],
      ),
    );
  }
}

class OutlinceButton extends StatefulWidget {
  final String btnText;
  OutlinceButton({this.btnText});
  @override
  _OutlinceButtonState createState() => _OutlinceButtonState();
}

class _OutlinceButtonState extends State<OutlinceButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.purple, width: 2),
          borderRadius: BorderRadius.circular(50)),
      padding: EdgeInsets.all(20),
      child: (Center(
        child: Text(
          widget.btnText,
          style: TextStyle(
            color: Colors.purple,
            fontSize: 16,
          ),
        ),
      )),
    );
  }
}
