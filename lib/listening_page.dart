import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutterproject/color_palette.dart';

class StoryAudioPage extends StatefulWidget {
  @override
  _StoryAudioPageState createState() => _StoryAudioPageState();
}

class _StoryAudioPageState extends State<StoryAudioPage> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  String? currentPlayingStory;

  // Hikaye bilgileri
  final List<Map<String, String>> stories = [
    {'title': 'Arsèn Lupen: Kibar Hırsız', 'file': '/Users/ugurcancirak/Desktop/story.mp3', 'image': 'images/book.jpeg'},
    {'title': 'Arsen Lupen: Herlock Sholmes\'e Karşı', 'file': 'voices/story1.mp3', 'image': 'images/book4.jpeg'},
    {'title': 'Arsèn Lupen: Oyuk İğne', 'file': 'voices/story2.mp3', 'image': 'images/book2.jpeg'},
    {'title': 'Arsèn Lupen: 813', 'file': 'voices/story3.mp3', 'image': 'images/book5.jpeg'},
    {'title': 'Arsèn Lupen: Kristal Tıpa', 'file': 'voices/story5.mp3', 'image': 'images/book10.jpeg'},
    {'title': 'Arsèn Lupen: Arsen Lupen\'in İtirafları', 'file': 'voices/story6.mp3', 'image': 'images/book6.jpeg'},
    {'title': 'Arsèn Lupen: Saat Sekizi Çalarken', 'file': 'voices/story7.mp3', 'image': 'images/book7.jpeg'},
    {'title': 'Arsèn Lupen: Esrarengiz Ev', 'file': 'voices/story8.mp3', 'image': 'images/book8.jpeg'},
    // {'title': 'Arsèn Lupen: Üç Söğüt', 'file': 'voices/story9.mp3', 'image': 'images/book9.jpeg'},
  ];

  void playPauseAudio(String storyFile) async {
    if (isPlaying && currentPlayingStory == storyFile) {
      await _audioPlayer.pause();
      setState(() {
        isPlaying = false;
        currentPlayingStory = null;
      });
    } else {
      await _audioPlayer.stop();
      await _audioPlayer.play(AssetSource(storyFile));
      setState(() {
        isPlaying = true;
        currentPlayingStory = storyFile;
      });
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
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
          // Arka plan resmi
          Positioned.fill(
            child: Opacity(
              opacity: 0.2, // Opaklık seviyesi
              child: Image.asset(
                'images/1.jpeg', // Arka plan resmi
                fit: BoxFit.cover, // Resmi tam ekran yap
              ),
            ),
          ),
          // İçerik
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
                      // Küçük resim
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0), // Köşeleri yuvarla
                        child: Image.asset(
                          story['image']!,
                          width: 50, // Daha küçük bir boyut
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 12), // Resim ile metin arası boşluk
                      // Hikaye ismi
                      Expanded(
                        child: Text(
                          story['title']!,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis, // Uzun metinler taşmasın
                        ),
                      ),
                      SizedBox(width: 8), // Butonla isim arası boşluk
                      // Oynat/Duraklat butonu
                      ElevatedButton.icon(
                        onPressed: () => playPauseAudio(story['file']!),
                        icon: Icon(
                          currentPlayingStory == story['file'] && isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                          size: 20,
                        ),
                        label: Text(
                          currentPlayingStory == story['file'] && isPlaying
                              ? 'Duraklat'
                              : 'Oynat',
                          style: TextStyle(fontSize: 14),
                        ),
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