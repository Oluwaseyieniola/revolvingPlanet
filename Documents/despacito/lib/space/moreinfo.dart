import 'package:flutter/material.dart';

class Astro extends StatefulWidget {
  const Astro({super.key});

  @override
  State<Astro> createState() => _AstroState();
}

class _AstroState extends State<Astro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/walking.jpg'),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            Row(children: [
              Padding(
                padding: const EdgeInsets.only(top: 60, left: 20),
                child: ShaderMask(
                  shaderCallback: (bounds) {
                    return const LinearGradient(colors: [
                      Colors.white,
                      Color.fromARGB(255, 124, 122, 122)
                    ], begin: Alignment.topRight, end: Alignment.bottomRight)
                        .createShader(bounds);
                  },
                  child: const Text(
                    'Axial tilt: 25.9\u00B0 to its orbital plane\nMean density: 3.9335 g/cm\u00B3\nMars:6.4171x1023kg',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
              const SizedBox(
                width: 120,
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Next',
                    style: TextStyle(color: Colors.white),
                  )),
              const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              )
            ]),
            const SizedBox(
              height: 120,
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.white,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Ancient and Medieval\nObservations   ',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                const SizedBox(
                  width: 170,
                ),
                const Text(
                  'Visit',
                  style: TextStyle(color: Colors.white),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_horiz),
                  color: Colors.white,
                )
              ],
            ),
            const SizedBox(
              height: 320,
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.white,
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Physical characteristics\nMars is approximately half the diameter\nof Earth, with surface area only slightly\nless than the total area of Earth\'s dry land',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.white,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 5, left: 5),
                  child: Text(
                    'See also',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Mars monolith\nMagnetic field\nOutline of Mars\nSolar system\nMinralogy of Mars\nMars in cultureMoons',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.white,
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'External links',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
                const SizedBox(
                  width: 200,
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Google Mars',
                      style: TextStyle(color: Colors.white),
                    )),
                const Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                )
              ],
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.white,
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      shape: BoxShape.circle),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;

  SlideRightRoute({required this.page})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return page;
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
}
