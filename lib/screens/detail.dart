import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:readmore/readmore.dart';
import 'package:slider_button/slider_button.dart';

import '../models/pets_model.dart';

class DetailPage extends StatefulWidget {
  final Pets pets;
  const DetailPage({required this.pets, super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isSwiped = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.pets.color.withOpacity(0.5),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: const Icon(Icons.arrow_back_ios_rounded,
                    color: Colors.black))),
        centerTitle: true,
        elevation: 0,
        title: Text(
          widget.pets.name,
          style: GoogleFonts.rubik(
              color: Color(0xff091420),
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              fontSize: 20),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                decoration:
                    BoxDecoration(color: widget.pets.color.withOpacity(0.5)),
                child: Stack(
                  children: [
                    Positioned(
                      left: -60,
                      top: 30,
                      child: Transform.rotate(
                          angle: -11.5,
                          child: SvgPicture.asset(
                            'assets/Paw_Print.svg',
                            color: widget.pets.color,
                            height: 300,
                          )),
                    ),
                    Positioned(
                      right: -60,
                      bottom: -60,
                      child: Transform.rotate(
                          angle: 12,
                          child: SvgPicture.asset(
                            'assets/Paw_Print.svg',
                            color: widget.pets.color,
                            height: 300,
                          )),
                    ),
                    Hero(
                      tag: widget.pets.name,
                      child: InteractiveViewer(
                        child: Center(
                          child: Image.asset(
                            widget.pets.image,
                            height: MediaQuery.of(context).size.height * 0.45,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            Positioned(
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.55,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.pets.name,
                                    style: GoogleFonts.poppins().copyWith(
                                      fontSize: 24,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on_outlined,
                                        color: Color(0xFF2596be),
                                        size: 16,
                                      ),
                                      Text(
                                        '${widget.pets.location} (${widget.pets.distance} Km)',
                                        style: GoogleFonts.poppins().copyWith(
                                            color:
                                                Colors.black.withOpacity(0.6),
                                            fontSize: 14),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        offset: const Offset(0, 3),
                                        color: widget.pets.fav
                                            ? Colors.red
                                            : Colors.black.withOpacity(0.6),
                                        blurRadius: 5,
                                        spreadRadius: 1)
                                  ]),
                              child: Icon(
                                widget.pets.fav
                                    ? Icons.favorite_rounded
                                    : Icons.favorite_border_rounded,
                                color: widget.pets.fav
                                    ? Colors.red
                                    : Colors.black.withOpacity(0.6),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            )
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DetailItem(
                              color: Colors.green,
                              detail: widget.pets.sex,
                              detail_: 'Sex',
                            ),
                            DetailItem(
                              color: Colors.orange,
                              detail: '${widget.pets.age} Years',
                              detail_: 'Age',
                            ),
                            DetailItem(
                              color: Color(0xFF2596be),
                              detail: "${widget.pets.weight} Kg",
                              detail_: 'Weight',
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red,
                                // image: DecorationImage(
                                //     image:
                                //         AssetImage(widget.pets.owner.image),
                                //     fit: BoxFit.cover)
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.pets.owner.name,
                                    style: GoogleFonts.poppins().copyWith(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${widget.pets.name} Owner",
                                    style: GoogleFonts.poppins().copyWith(
                                      fontSize: 14,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Color(0xFF2596be).withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Icon(
                                Icons.chat_outlined,
                                color: Color(0xFF2596be),
                                size: 16,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.red.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Icon(
                                Icons.phone_outlined,
                                color: Colors.red,
                                size: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        ReadMoreText(
                          widget.pets.description,
                          textAlign: TextAlign.justify,
                          trimCollapsedText: 'See More',
                          colorClickableText: Colors.orange,
                          trimLength: 100,
                          trimMode: TrimMode.Length,
                          style: GoogleFonts.poppins()
                              .copyWith(color: Colors.black.withOpacity(0.6)),
                        ),
                        const SizedBox(height: 20),
                        SliderButton(
                          height: 58,
                          width: double.infinity,
                          radius: 16,
                          backgroundColor: const Color(0xffE6E9F2),
                          action: () {
                            _showMyDialog(widget.pets.name);
                            setState(() {
                              isSwiped = true;
                            });
                          },
                          buttonColor: widget.pets.color,
                          buttonSize: 46,
                          dismissThresholds: 0.8,
                          vibrationFlag: true,
                          shimmer: true,
                          baseColor: Color.fromARGB(255, 116, 120, 136),
                          highlightedColor: const Color(0xffA8AFC7),
                          alignLabel: const Alignment(0, 0),
                          label: Text("Adopt Me",
                              style: GoogleFonts.nunito(
                                  color: const Color(0xffA8AFC7),
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16),
                              textAlign: TextAlign.left),
                          icon: SvgPicture.asset(
                            "assets/Paw_Print.svg",
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            isSwiped
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Lottie.asset('assets/confetti/game_confetti.json'),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialog(String name) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Thank you!!!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('You’ve now adopted '),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Okay'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class DetailItem extends StatelessWidget {
  final Color color;
  final String detail, detail_;
  const DetailItem({
    Key? key,
    required this.color,
    required this.detail,
    required this.detail_,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          Container(
            height: 80,
            width: MediaQuery.of(context).size.width / 3 - 25,
            decoration: BoxDecoration(
              color: color.withOpacity(0.6),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: -10,
                  right: -5,
                  child: Transform.rotate(
                    angle: 12,
                    child: SvgPicture.asset(
                      'assets/Paw_Print.svg',
                      color: color,
                      height: 60,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 80,
            width: MediaQuery.of(context).size.width / 3 - 25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  detail,
                  style: GoogleFonts.poppins().copyWith(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  detail_,
                  style: GoogleFonts.poppins().copyWith(
                    fontSize: 14,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
