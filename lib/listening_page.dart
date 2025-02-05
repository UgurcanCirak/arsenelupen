import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutterproject/color_palette.dart';

class StoryAudioPage extends StatefulWidget {
  @override
  _StoryAudioPageState createState() => _StoryAudioPageState();
}

class _StoryAudioPageState extends State<StoryAudioPage> {
  // Hikaye bilgileri (YouTube linkleri)
  final List<Map<String, String>> stories = [
    {'title': 'Arsèn Lupen: Kibar Hırsız', 'url': 'https://www.youtube.com/watch?v=MQO9QaRvZ5w&list=PL1EUwUJUgyVGxRk2JD0OZxt6tdZUSxuNs', 'image': 'images/book.jpeg'},
    {'title': 'Arsen Lupen: Herlock Sholmes\'e Karşı', 'url': 'https://www.youtube.com/watch?v=XXXXXXXXXXX', 'image': 'images/book4.jpeg'},
    {'title': 'Arsèn Lupen: Oyuk İğne', 'url': 'https://www.youtube.com/watch?v=XXXXXXXXXXX', 'image': 'images/book2.jpeg'},
    {'title': 'Arsèn Lupen: 813', 'url': 'https://www.youtube.com/watch?v=XXXXXXXXXXX', 'image': 'images/book5.jpeg'},
    {'title': 'Arsèn Lupen: Kristal Tıpa', 'url': 'https://www.youtube.com/watch?v=XXXXXXXXXXX', 'image': 'images/book10.jpeg'},
    {'title': 'Arsèn Lupen: Arsen Lupen\'in İtirafları', 'url': 'https://www.youtube.com/watch?v=XXXXXXXXXXX', 'image': 'images/book6.jpeg'},
    {'title': 'Arsèn Lupen: Saat Sekizi Çalarken', 'url': 'https://www.youtube.com/watch?v=XXXXXXXXXXX', 'image': 'images/book7.jpeg'},
    {'title': 'Arsèn Lupen: Esrarengiz Ev', 'url': 'https://www.youtube.com/watch?v=XXXXXXXXXXX', 'image': 'images/book8.jpeg'},
  ];

  void openStoryPage(String title, String url) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StoryPlayerPage(title: title, url: url),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hikaye Dinle'),
        backgroundColor: color3,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.2,
              child: Image.asset(
                'images/1.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: stories.length,
              itemBuilder: (context, index) {
                final story = stories[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          story['image']!,
                          width: 50,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          story['title']!,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 8),
                      ElevatedButton.icon(
                        onPressed: () => openStoryPage(story['title']!, story['url']!),
                        icon: Icon(Icons.play_arrow, size: 20),
                        label: Text('Oynat', style: TextStyle(fontSize: 14)),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// 🔹 Yeni Sayfa: YouTube Hikaye Oynatma Sayfası
class StoryPlayerPage extends StatefulWidget {
  final String title;
  final String url;

  StoryPlayerPage({required this.title, required this.url});

  @override
  _StoryPlayerPageState createState() => _StoryPlayerPageState();
}

class _StoryPlayerPageState extends State<StoryPlayerPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    String? videoId = YoutubePlayer.convertUrlToId(widget.url);
    if (videoId != null) {
      _controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: YoutubePlayerFlags(autoPlay: true, mute: false),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: color3,
      ),
      body: Center(
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
        ),
      ),
    );
  }
}
