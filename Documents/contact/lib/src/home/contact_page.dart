import 'package:contact/src/home/page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  double _left = 0;
  double _top = 0;
  double opacityLevel = 0.0;

  //
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri(scheme: "https", host: url);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch url';
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        opacityLevel = 1.0;
      });
    });
  }

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 33, 33, 41),
      body: ListView(children: [
        Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey)),
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AVI()));
                        },
                        icon: const Icon(Icons.person)),
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey)),
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.star_border)),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.elliptical(10, 10)),
                  child: GestureDetector(
                    onTap: () {
                      const FadeInContainer();
                    },
                    child: Container(
                      height: 150,
                      width: 200,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 185, 98, 67),
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.blue)),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: _left,
                  top: _top,
                  child: GestureDetector(
                    onLongPress: () {
                      const FadeInContainer();
                    },
                    onPanUpdate: (details) {
                      setState(() {
                        _left += details.delta.dx;
                        _top += details.delta.dy;
                      });
                    },
                    child: Container(
                      height: 20,
                      width: 100,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [Colors.green, Colors.red]),
                          shape: BoxShape.circle,
                          border: Border.all()),
                      child: const Text(
                        'online',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            child: Text(
              'Oluwaseyi ogunjinmi',
              style: GoogleFonts.pacifico(
                  textStyle: const TextStyle(fontSize: 30)),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            child: Text('Mobile Engineer',
                style: GoogleFonts.pacifico(
                    color: Colors.white,
                    textStyle: const TextStyle(fontSize: 20))),
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                'ianolenblogs@gmail.com',
                style: GoogleFonts.pacifico(
                    textStyle: const TextStyle(
                        color: Color.fromARGB(255, 137, 92, 75))),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey)),
                child: IconButton(
                    onPressed: () {
                      _launchURL(
                          'https://www.linkedin.com/in/oluwaseyi-ogunjinmi-405055216');
                    },
                    icon: Image.asset('assets/images/linkedin.png')),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey)),
                child: IconButton(
                    onPressed: () {
                      _launchURL('https://github.com/Oluwaseyieniola');
                    },
                    icon: Image.asset('assets/images/github.png')),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey)),
                child: IconButton(
                    onPressed: () {
                      _launchURL('https://twitter.com/oluwaseyiGodDid');
                    },
                    icon: Image.asset('assets/images/twitter.png')),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey)),
                child:
                    IconButton(onPressed: () {}, icon: const Icon(Icons.phone)),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Today',
                  style: GoogleFonts.teko(
                      textStyle: const TextStyle(fontSize: 20)),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 200,
                width: 150,
                color: const Color.fromARGB(255, 46, 46, 57),
              ),
              Container(
                height: 200,
                width: 150,
                color: const Color.fromARGB(255, 50, 50, 61),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bio',
                  style: GoogleFonts.teko(
                      textStyle: const TextStyle(fontSize: 20)),
                ),
              ],
            ),
          ),
          Container(
            height: 100,
            width: double.maxFinite,
            color: const Color.fromARGB(255, 46, 46, 57),
            child: Text(
              ' Oluwaseyi ogunjinmi is a mobile developer with over 2 years experience working \n with Flutter building cross platform mobile applications and also working with\n dart to build web tools',
              style: GoogleFonts.teko(
                  textStyle: const TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 150, 143, 143))),
            ),
          ),
        ]),
      ]),
    );
  }
}

class FadeInContainer extends StatefulWidget {
  const FadeInContainer({super.key});

  @override
  _FadeInContainerState createState() => _FadeInContainerState();
}

class _FadeInContainerState extends State<FadeInContainer> {
  double opacityLevel = 0.0;

  @override
  void initState() {
    super.initState();
    // set initial opacity to 0 to create the fade in effect
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        opacityLevel = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacityLevel,
      duration: const Duration(seconds: 2),
      child: Container(
        height: 100,
        width: 100,
        color: Colors.blue,
      ),
    );
  }
}

// tried implementing this but didn't work out

/*class _CutEdgePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white;
    final path = Path()
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height * 0.8)
      ..lineTo(size.width * 0.95, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
*/

// Method for  making phone calls

_callNumber(String phoneNumber) async {
  String number = '08108242167';
  await FlutterPhoneDirectCaller.callNumber(number);
}

_launchPhoneURL(String phoneNumber) async {
  String url = 'tel:$phoneNumber';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
