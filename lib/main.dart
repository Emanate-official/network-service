import 'package:flutter/material.dart';
import 'package:network_status/network.dart';
import 'package:universaltoastr/universaltoastr.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    NetworkService networkService = NetworkService();
    UniversalToastr _universalToastr = UniversalToastr().init(context);

    networkService.init(
      context: context,
      onNetworkDisconnect: () {
        _universalToastr.show(
          message: 'Connection was lost',
          duration: const Duration(seconds: 2),
          success: false,
        );
      },
      onNetworkReconnect: () {
        _universalToastr.show(
          message: 'Connected',
          duration: const Duration(seconds: 2),
          success: true,
        );
      },
    );
    networkService.startConnectionService();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(),
      ),
    );
  }
}
