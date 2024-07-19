import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:fitness_app/components/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: FrontPage(),
    );
  }
}

class FrontPage extends StatefulWidget {
  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  @override
  void initState() {
    super.initState();
    _navigateToNextPage();
  }

  void _navigateToNextPage() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Lottie.asset(
              "assets/animations/dumbbell.json",
              width: 360,
              height: 360,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 50),
            Text(
              'FitnessFlow',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            )
                .animate()
                .scaleXY(end: 1.1, duration: 1000.ms)
                .shimmer(delay: 400.ms, duration: 1000.ms)
                .elevation(end: 20)
                .then(delay: 600.ms)
                .scaleXY(end: 1 / 1.1),
          ],
        ),
      ),
    );
  }
}
