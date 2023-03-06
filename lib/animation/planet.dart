import 'package:flutter/material.dart';
import 'dart:math';

class net extends StatelessWidget {
  const net({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              Positioned(
                  top: 70,
                  left: 150,
                  child: Container(
                    child: Center(
                      child: PlanetRotation(),
                    ),
                  )),
              Positioned(
                top: 100,
                left: 100,
                child: Galaxy(starCount: 100, radius: 200),
              ),
              Positioned(
                  top: 200,
                  right: 250,
                  child: Container(
                    child: Center(
                      child: PlanetRotation2(),
                    ),
                  )),
            ],
          )),
    );
  }
}

class PlanetRotation extends StatefulWidget {
  const PlanetRotation({super.key});

  @override
  State<PlanetRotation> createState() => _PlanetRotationState();
}

class _PlanetRotationState extends State<PlanetRotation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        child: const Planet(),
        builder: (context, child) {
          return Transform.rotate(
            angle: _animationController.value * 0.5 / 4 * pi,
            child: child,
          );
        });
  }
}

class Planet extends StatelessWidget {
  const Planet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/planet.jpeg')),
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}

// planet 2
class Planet2 extends StatelessWidget {
  const Planet2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: 200,
        decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage('assets/images/planet.png')),
            color: Colors.transparent,
            shape: BoxShape.circle));
  }
}

// PlanetRotation2
class PlanetRotation2 extends StatefulWidget {
  const PlanetRotation2({super.key});

  @override
  State<PlanetRotation2> createState() => _PlanetRotation2State();
}

class _PlanetRotation2State extends State<PlanetRotation2>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        child: const Planet2(),
        builder: (context, child) {
          return Transform.rotate(
            angle: _animationController.value * 0.5 / 4 * pi,
            child: child,
          );
        });
  }
}

// This class was used to create the stars in galaxy animation
// p
class Galaxy extends StatelessWidget {
  final int starCount;
  final double radius;
  final double centerSize;
  final List<Color> colors;
  const Galaxy(
      {super.key,
      required this.starCount,
      required this.radius,
      this.centerSize = 10.0,
      this.colors = const [
        Colors.white,
        Colors.yellow,
        Colors.blue,
        Colors.green,
        Colors.red
      ]});

  @override
  Widget build(BuildContext context) {
    final random = Random();
    return CustomPaint(
      painter: _GalaxyPainter(
        starCount: starCount,
        radius: radius,
        centerSize: centerSize,
        colors: colors,
        random: random,
      ),
    );
  }
}

class _GalaxyPainter extends CustomPainter {
  late final int starCount;
  late final double radius;
  late final double centerSize;
  late final List<Color> colors;
  late final Random random;
  _GalaxyPainter({
    required this.starCount,
    required this.radius,
    required this.centerSize,
    required this.colors,
    required this.random,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    final centerPaint = Paint()..color = Colors.white;
    canvas.drawCircle(
      Offset(centerX, centerY),
      centerSize,
      centerPaint,
    );

    for (int i = 0; i < starCount; i++) {
      final angle = random.nextDouble() * 2 * pi;
      final distance = random.nextDouble() * radius;
      final color = colors[random.nextInt(colors.length)];

      final starPaint = Paint()..color = color;

      final starX = centerX + distance * cos(angle);
      final starY = centerY + distance * sin(angle);

      canvas.drawCircle(
        Offset(starX, starY),
        random.nextDouble() * 3 + 1,
        starPaint,
      );
    }
  }

  @override
  bool shouldRepaint(_GalaxyPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_GalaxyPainter oldDelegate) => false;
}
