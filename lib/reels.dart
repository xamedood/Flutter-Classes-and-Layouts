import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';

class MyReels extends StatefulWidget {
  const MyReels({super.key});

  @override
  State<MyReels> createState() => _MyReelsState();
}

class _MyReelsState extends State<MyReels> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(
      'lib/images/Tech Specialist Business Card Black Green White Modern Tech Style.mp4',
    )..initialize().then((_) {
        setState(() {});
        _controller.setLooping(true);
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // 🎥 VIDEO BACKGROUND
            Positioned.fill(
              child: _controller.value.isInitialized
                  ? VideoPlayer(_controller)
                  : const Center(child: CircularProgressIndicator()),
            ),

            // 🌫 Dark overlay for readability
            Container(color: Colors.black.withOpacity(0.2)),

            // 🔤 UI OVERLAY
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // TOP BAR
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Reels",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Icon(Icons.camera_alt, color: Colors.white),
                    ],
                  ),

                  // BOTTOM CONTENT
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // LEFT TEXT
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                backgroundImage:
                                    AssetImage('lib/images/dp.png'),
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                "Username",
                                style: TextStyle(color: Colors.white),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text("Subscribe"),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "I am actively active here",
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: const [
                              Icon(Icons.music_note, color: Colors.white),
                              SizedBox(width: 4),
                              Text(
                                "Juice WRLD - Wishing Well",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),

                      // RIGHT ICONS
                      Column(
                        children: const [
                          Icon(FontAwesomeIcons.heart, color: Colors.white),
                          SizedBox(height: 16),
                          Icon(FontAwesomeIcons.comment, color: Colors.white),
                          SizedBox(height: 16),
                          Icon(FontAwesomeIcons.paperPlane,
                              color: Colors.white),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_library), label: "Reels"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Likes"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
