import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/onboard_model.dart';
import 'home_screen.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    double resp_width = MediaQuery.of(context).size.width / 375;
    double font_w = resp_width * 0.97;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.75,
            color: Colors.white,
            child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: onBoardData.length,
                itemBuilder: (context, index) => OnBoardContent(
                      onBoard: onBoardData[index],
                    )),
          ),
          currentPage == 2
              ? GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                        (route) => false);
                  },
                  child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.6,
                      decoration: BoxDecoration(
                          color: Color(0xFF2596be),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, 3),
                                color: Color(0xFF2596be),
                                spreadRadius: 0,
                                blurRadius: 5)
                          ]),
                      child: Center(
                        child: Text(
                          'Get Started',
                          style: GoogleFonts.poppins()
                              .copyWith(color: Colors.white, fontSize: 16),
                        ),
                      )),
                )
              : SizedBox(),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                  onBoardData.length, (index) => indicator(index: index))
            ],
          )
        ],
      ),
    );
  }

  AnimatedContainer indicator({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      width: currentPage == index ? 20 : 6,
      height: 6,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: currentPage == index
              ? Colors.orange
              : Colors.black.withOpacity(0.6)),
    );
  }
}

class OnBoardContent extends StatelessWidget {
  final OnBoards onBoard;
  const OnBoardContent({required this.onBoard, super.key});

  @override
  Widget build(BuildContext context) {
    double resp_width = MediaQuery.of(context).size.width / 375;
    double font_w = resp_width * 0.97;
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width - 40,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width - 40,
                    color: Colors.orange.shade200,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10,
                          left: -45,
                          height: 150 * resp_width,
                          width: 150 * resp_width,
                          child: Transform.rotate(
                              angle: -11.5,
                              child: SvgPicture.asset(
                                'assets/Paw_Print.svg',
                                color: Colors.black26,
                              )),
                        ),
                        Positioned(
                          bottom: -30,
                          right: -30,
                          height: 150 * resp_width,
                          width: 150 * resp_width,
                          child: Transform.rotate(
                              angle: 12,
                              child: SvgPicture.asset(
                                'assets/Paw_Print.svg',
                                color: Colors.black26,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: Image.asset(
                  onBoard.image,
                  height: 350,
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 30),
        Text.rich(
          TextSpan(
              style: GoogleFonts.poppins().copyWith(
                  height: 1.2,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 32),
              children: [
                TextSpan(text: 'Find Your ', style: GoogleFonts.poppins()),
                TextSpan(
                    text: 'Dream\n',
                    style: GoogleFonts.poppins().copyWith(color: Colors.black)),
                TextSpan(text: 'Pet Here', style: GoogleFonts.poppins()),
              ]),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Text(
          onBoard.text,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins()
              .copyWith(color: Colors.black.withOpacity(0.6)),
        )
      ],
    );
  }
}
