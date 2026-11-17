import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();

  int currentIndex = 0;

  final List<Map<String, dynamic>> pages = [
    {
      'image':
          'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?w=500',
      'title': 'Welcome to Dishover',
      'description': 'Discover fresh, healthy meals.',
    },
    {
      'image':
          'https://images.unsplash.com/photo-1547592180-85f173990554?w=500',
      'title': 'Quick Delivery',
      'description': 'Get your meals delivered quickly.',
    },
    {
      'image':
          'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=500',
      'title': 'Start Today!',
      'description': 'Start your culinary journey with us today!',
    },
  ];

  void nextPage() {
    if (currentIndex < 2) {
      controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      print('Go to back');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    controller.animateToPage(
                      2,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Skip',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ),
              ),
            ),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 350,
                    child: PageView.builder(
                      controller: controller,
                      itemCount: pages.length,
                      onPageChanged: (index) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              pages[index]['image'],
                              height: 200,
                              width: 250,
                              fit: BoxFit.contain,
                            ),

                            const SizedBox(height: 30),

                            Text(
                              pages[index]['title'],
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 15),

                            Text(
                              pages[index]['description'],
                              textAlign: TextAlign.center,
                            ),
                          ],
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (i) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.all(5),
                        height: 15,
                        width: currentIndex == i ? 25 : 10,
                        decoration: BoxDecoration(
                          color: currentIndex == i
                              ? Colors.deepOrange
                              : Colors.grey.shade300,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
