import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/login",
      routes: {
        "/home": (context) => const HomeRoute(),
        "/deposit": (context) => DepositRoute(),
        "/withdrawal": (context) => WithdrawalRoute(),
        "/balance": (context) => const BalanceRoute(),
        "/login": (context) => LoginRoute(),
      },
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      // appBar: AppBar(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),
      backgroundColor: Colors.indigoAccent,
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          // Column is also a layout widget. It takes a list of children and
          // arranges them ven horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'My Bank APP',
              style: TextStyle(
                fontSize: 46,
                color: Colors.white,
                fontWeight: FontWeight.w600,
                // fontFamily:
              ),

            ),
            // TextButton(
            //     style: ButtonStyle(
            //       foregroundColor: MaterialStateProperty.all<Color>(Colors.brown)
            //     ),
            //     onPressed: (){}
            //     , child: Text('Get Started'))

          ],
        ),
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// Home
class HomeRoute extends StatelessWidget {
  const HomeRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[

                    Text(getSalutation()),
                    SizedBox(height: 10),
                    Text("John Doe", style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text("ACC: 123456"),
                    SizedBox(height: 10),
                    Text(DateTime.now().toString().substring(0, 10)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 50),
            Expanded(
              child: ListView(
                children: <Widget>[

                    Column(
                      children: [
                        GestureDetector(
                            onTap: () => Navigator.of(context).pushNamed('/deposit'),
                                child: Container(
                                      height: 70,
                                      decoration: BoxDecoration(
                                      color: Colors.green[100],
                                      borderRadius: BorderRadius.circular(10),
                                      ),
                                child: const Center(
                                    child: Text("Deposit"),
                                  ),
                              ),
                        ),
                        SizedBox(height: 20),
                        GestureDetector(
                              onTap: () => Navigator.of(context).pushNamed('/withdrawal'),
                                  child: Container(
                                      height: 70,
                                      decoration: BoxDecoration(
                                      color: Colors.lime[600],
                                      borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Center(
                                      child: Text("Withdrawal"),
                                      ),
                                  ),
                        ),
                        SizedBox(height: 20),
                        GestureDetector(
                            onTap: () => Navigator.of(context).pushNamed('/balance'),
                                  child: Container(
                                      height: 70,
                                      decoration: BoxDecoration(
                                      color: Colors.teal[200],
                                      borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text("Balance"),
                                      ),
                                  ),
                             ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getSalutation() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return "Good Morning";
    } else if (hour < 18) {
      return "Good Afternoon";
    } else {
      return "Good Evening";
    }
  }
}


// Login
class LoginRoute extends StatelessWidget {
  LoginRoute({super.key});
  final _formKey = GlobalKey<FormState>();
  late String? _username, _password;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo.png'),
              SizedBox(height: 40),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a username';
                  }
                  Navigator.of(context).pushNamed('/home');
                  return null;
                },
                onSaved: (value) => _username = value,
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
                onSaved: (value) => _password = value,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    print(_username);
                    print(_password);
                  }
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// Deposit
class DepositRoute extends StatelessWidget {
  DepositRoute({super.key});
  final _formKey = GlobalKey<FormState>();
  String? _fromAccountNumber, _toAccountNumber;
  late int _amount;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Perform transfer logic here...
      // ...
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'From Account Number',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a valid account number';
                      }
                      return null;
                    },
                    onSaved: (value) => _fromAccountNumber = value!,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'To Account Number',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a valid account number';
                      }
                      return null;
                    },
                    onSaved: (value) => _toAccountNumber = value!,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Amount',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter an amount';
                      }
                      return null;
                    },
                    onSaved: (value) => _amount = int.parse(value!),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: TextButton(
                      child: Text('Transfer'),
                      onPressed: _submitForm,
                    ),
                  ),
                ],
              ),
            ),
          )
      ),


    );
  }
}

class WithdrawalRoute extends StatelessWidget {
  WithdrawalRoute({super.key});

  final _formKey = GlobalKey<FormState>();
  String? _fromAccountNumber, _toAccountNumber;
  late int _amount;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Perform transfer logic here...
      // ...
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'From Account Number',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a valid account number';
                      }
                      return null;
                    },
                    onSaved: (value) => _fromAccountNumber = value!,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'To Account Number',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a valid account number';
                      }
                      return null;
                    },
                    onSaved: (value) => _toAccountNumber = value!,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Amount',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter an amount';
                      }
                      return null;
                    },
                    onSaved: (value) => _amount = int.parse(value!),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: TextButton(
                      child: Text('Transfer'),
                      onPressed: _submitForm,
                    ),
                  ),
                ],
              ),
            ),
          )
      ),


    );
  }
}

class BalanceRoute extends StatelessWidget {
  const BalanceRoute({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(),
    );
  }
}