import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../bloc/history_bloc/history_bloc.dart';
import '../models/history_model.dart';

class HistoryParent extends StatelessWidget {
  const HistoryParent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HistoryBloc()..add(GetHistoryData()),
          ),
        ],
        child: History(),
      ),
    );
  }
}

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
          "History",
          style: GoogleFonts.rubik(
              color: Color(0xff091420),
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              fontSize: 20),
        ),
      ),
      body: BlocBuilder<HistoryBloc, HistoryState>(builder: (context, state) {
        if (state is HistoryLoading) {
          return SizedBox();
        } else if (state is HistoryLoded) {
          return SizedBox();
          // return Container(
          //     height: MediaQuery.of(context).size.height,
          //     width: MediaQuery.of(context).size.width,
          //     child: ListView.builder(
          //         itemCount: state.data.length,
          //         scrollDirection: Axis.horizontal,
          //         itemBuilder: (context, index) => PetsItem(
          //               data: state.data[index],
          //             )));
        }
        return Container();
      }),
    );
  }
}

class PetsItem extends StatelessWidget {
  final Historymodel data;
  const PetsItem({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.35,
          width: MediaQuery.of(context).size.width * 0.5,
          color: data.color.withOpacity(0.6),
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
                      color: data.color,
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
                      color: data.color,
                      fit: BoxFit.cover,
                    )),
              ),
              Positioned(
                bottom: -10,
                right: -80,
                left: 20,
                child: Image.asset(
                  data.image,
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
                            data.name,
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
                                'Distance (${data.distance} Km)',
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
