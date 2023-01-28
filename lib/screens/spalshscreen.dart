import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'onboard.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 10), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const Onboard()),
          (route) => false);
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    double resp_width = MediaQuery.of(context).size.width / 375;
    double font_w = resp_width * 0.97;
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFF282a57), Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Column(
          children: [
            Spacer(),
            Lottie.asset(
              'assets/splashscreen/dogLottie.json',
              height: 200 * resp_width,
              width: 200 * resp_width,
              fit: BoxFit.fill,
            ),
            Image.asset(
              'assets/splashscreen/appLogo.png',
              height: 100 * resp_width,
              width: 100 * resp_width,
            ),
            Spacer(),
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 20.0,
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText('Made with ❤️ by Nithin Shetty'),
                ],
                isRepeatingAnimation: true,
              ),
            ),
            SizedBox(
              height: 20 * resp_width,
            )
          ],
        ),
      ),
    );
  }
}
