import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/pets_model.dart';
import 'detail.dart';
import 'history.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Pets> _petsList = [];
  @override
  void initState() {
    _petsList = pets;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    print(enteredKeyword);
    List<Pets> result = [];
    if (enteredKeyword.isEmpty) {
      result = pets;
    } else {
      result = pets
          .where((user) =>
              user.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    print(result[0].name);
    setState(() {
      _petsList = result;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xffffd89b), Color(0xff19547b)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: TextField(
                      onChanged: (value) => _runFilter(value),
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                          hintText: 'Search',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 18),
                          prefixIcon: const Icon(Icons.search)),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HistoryParent()));
                    },
                    child: const Icon(
                      Icons.history_outlined,
                      size: 40,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xFF2596be).withOpacity(0.6),
                  child: Stack(children: [
                    Positioned(
                      bottom: -35,
                      right: -30,
                      width: 150,
                      height: 150,
                      child: Transform.rotate(
                        angle: 12,
                        child: SvgPicture.asset(
                          'assets/Paw_Print.svg',
                          color: Color(0xFF2596be),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -35,
                      left: -35,
                      width: 150,
                      height: 150,
                      child: Transform.rotate(
                        angle: -12,
                        child: SvgPicture.asset(
                          'assets/Paw_Print.svg',
                          color: Color(0xFF2596be),
                        ),
                      ),
                    ),
                    Positioned(
                      top: -40,
                      left: 120,
                      width: 150,
                      height: 150,
                      child: Transform.rotate(
                        angle: -16,
                        child: SvgPicture.asset(
                          'assets/Paw_Print.svg',
                          color: Color(0xFF2596be),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 20,
                        height: 135,
                        child: Image.asset('assets/pets/homeBanner.png')),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Join Our Animal\nLovers Community',
                            style: GoogleFonts.poppins().copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.orange),
                            child: Text(
                              'Join Us',
                              style: GoogleFonts.poppins()
                                  .copyWith(color: Colors.white, fontSize: 14),
                            ),
                          )
                        ],
                      ),
                    )
                  ]),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24))),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent:
                            MediaQuery.of(context).size.width * 0.6),
                    itemCount: _petsList.length,
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DetailPage(pets: _petsList[index])));
                          },
                          child: PetsItem(
                            pets: _petsList[index],
                          ),
                        )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PetsItem extends StatelessWidget {
  final Pets pets;
  const PetsItem({required this.pets, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.35,
          width: MediaQuery.of(context).size.width * 0.5,
          color: pets.color.withOpacity(0.6),
          child: Stack(
            children: [
              Positioned(
                bottom: -10,
                right: -10,
                height: 100,
                width: 100,
                child: Transform.rotate(
                    angle: 12,
                    child: SvgPicture.asset(
                      'assets/Paw_Print.svg',
                      color: pets.color,
                      fit: BoxFit.cover,
                    )),
              ),
              Positioned(
                top: 100,
                left: -25,
                height: 100,
                width: 100,
                child: Transform.rotate(
                    angle: -11.5,
                    child: SvgPicture.asset(
                      'assets/Paw_Print.svg',
                      color: pets.color,
                      fit: BoxFit.cover,
                    )),
              ),
              Hero(
                tag: pets.name,
                child: Image.asset(
                  pets.image,
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            pets.name,
                            style: GoogleFonts.poppins().copyWith(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on_outlined,
                                color: Color(0xFF2596be),
                                size: 16,
                              ),
                              Text(
                                'Distance (${pets.distance} Km)',
                                style: GoogleFonts.poppins().copyWith(
                                  fontSize: 12,
                                  color: Colors.black.withOpacity(0.6),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Icon(
                        pets.fav
                            ? Icons.favorite_rounded
                            : Icons.favorite_outline_rounded,
                        color: pets.fav
                            ? Colors.red
                            : Colors.black.withOpacity(0.6),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
