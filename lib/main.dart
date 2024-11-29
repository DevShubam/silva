import 'package:flutter/material.dart';

void main() {
  runApp(const SilvaApp());
}

class SilvaApp extends StatelessWidget {
  const SilvaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Silva',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Dark Overlay for Contrast (Optional)
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          // Content
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Greeting and Start Button
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'Welcome to Silva',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Start your journey through history today!',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Taking you to lessons...')),
                        );
                      },
                      child: const Text('Start Learning'),
                    ),
                  ],
                ),
              ),

              // Carousel Centered at the Bottom
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      LessonCard(
                        title: 'Renaissance Era',
                        imagePath: 'assets/images/flutter_logo.png',
                      ), // TODO: Replace with lesson images
                      LessonCard(
                        title: 'World War II',
                        imagePath: 'assets/images/flutter_logo.png',
                      ), // TODO: Replace with lesson images
                      LessonCard(
                        title: 'Ancient Egypt',
                        imagePath: 'assets/images/flutter_logo.png',
                      ), // TODO: Replace with lesson images
                      LessonCard(
                        title: 'Industrial Revolution',
                        imagePath: 'assets/images/flutter_logo.png',
                      ), // TODO: Replace with lesson images
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LessonCard extends StatelessWidget {
  final String title;
  final String imagePath;

  const LessonCard({
    Key? key,
    required this.title,
    required this.imagePath,
  }) : super(key: key);
    
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(right: 16.0),
      child: SizedBox(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(imagePath, height: 120, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
