import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, snapshot) {
          if (snapshot.data!.contains(ConnectivityResult.mobile) ||
              snapshot.data!.contains(ConnectivityResult.wifi)) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                  child: Image.asset('assets/boburnham-inside.gif'),
                ),
                const Text(
                  'Welcome back! Now your internet is working perfectly',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            );
          } else if (snapshot.data!.contains(ConnectivityResult.vpn)) {
            return const Center(
              child: Text("It seems you're connected to VPN"),
            );
          } else {
            return SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 200,
                    child: Image.asset('assets/no-internet.gif'),
                  ),
                  const Text(
                    "It seems you're offline",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const Text(
                    "Check your internet connection",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CircularProgressIndicator(),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
