import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mercurio/screens/home.dart';
import 'package:mercurio/widgets/app_banner.dart';
import 'package:mercurio/widgets/colored_safe_area.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mercurio/widgets/tile.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ColoredSafeArea(
        color: Theme.of(context).primaryColor,
        child: Scaffold(
          body: Column(
            children: [
              const AppBanner(),
              Container(
                height: 400.0,
                margin:
                    const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
                child: MasonryGridView.count(
                  itemCount: 4,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(4),
                      child: Tile(
                        index: index,
                        extent: (index % 5 + 1) * 100,
                        child: Image.asset("assets/img/sample-$index.png",
                            fit: BoxFit.cover),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 50.0,
                width: 300.0,
                child: SvgPicture.asset(
                  "assets/img/line.svg",
                  fit: BoxFit.fitWidth,
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(left: 20.0, top: 20.0),
                child: const Text(
                  "Lorem ipsum",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: 'PlayfairDisplay',
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(left: 20.0, top: 8.0),
                child: const Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur id tincidunt tortor. Nulla facilisi.",
                  textAlign: TextAlign.left,
                  style:
                      TextStyle(fontFamily: 'PlayfairDisplay', fontSize: 14.0),
                ),
              ),
              Expanded(
                child: Column(children: [
                  const Expanded(child: Spacer()),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: const EdgeInsets.only(
                            bottom: 20, left: 20, right: 20),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(
                                const Size(double.infinity, 50.0)),
                            backgroundColor: MaterialStatePropertyAll(
                                Theme.of(context).primaryColor),
                            shape: MaterialStateProperty.all(
                                const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                    side: BorderSide(width: 1.6))),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Home()));
                          },
                          child: Text(
                            "Start Reading",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).dividerColor),
                          ),
                        ),
                      ))
                ]),
              )
            ],
          ),
        ));
  }
}
