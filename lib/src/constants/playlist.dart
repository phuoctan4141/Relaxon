import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

final List<AudioSource> playList = [
  AudioSource.asset(
    'assets/audios/reflected-light-147979.mp3',
    tag: MediaItem(
      id: "https://pixabay.com/music/beautiful-plays-reflected-light-147979/",
      title: "Reflected Light",
      artist: "SergePavkinMusic",
      artUri: Uri.parse(
          "https://cdn.pixabay.com/audio/2023/04/29/06-36-55-462_200x200.jpg"),
    ),
  ),
  AudioSource.asset(
    'assets/audios/eco-technology-145636.mp3',
    tag: MediaItem(
      id: "https://pixabay.com/music/beautiful-plays-eco-technology-145636/",
      title: "Eco Technology",
      artist: "Lexin Music",
      artUri: Uri.parse(
          "https://cdn.pixabay.com/audio/2023/04/08/15-11-40-213_200x200.jpg"),
    ),
  ),
  AudioSource.asset(
    'assets/audios/the-cradle-of-your-soul-15700.mp3',
    tag: MediaItem(
      id: 'https://pixabay.com/music/solo-guitar-the-cradle-of-your-soul-15700/',
      title: "The Cradle of Your Soul",
      artist: "Vitaliy Levkin",
      artUri: Uri.parse(
          "https://cdn.pixabay.com/audio/2022/04/06/06-57-42-712_200x200.png"),
    ),
  ),
  AudioSource.asset(
    'assets/audios/touch-and-sound-113676.mp3',
    tag: MediaItem(
      id: 'https://pixabay.com/music/modern-classical-touch-and-sound-113676/',
      title: "Touch and Sound",
      artist: "Juan Sanchez",
      artUri: Uri.parse(
          "https://cdn.pixabay.com/audio/2022/06/21/09-28-47-489_200x200.jpg"),
    ),
  ),
  AudioSource.asset(
    'assets/audios/weeknds-122592.mp3',
    tag: MediaItem(
      id: 'https://pixabay.com/music/beats-weeknds-122592/',
      title: "Weeknds",
      artist: "DayFox",
      artUri: Uri.parse(
          "https://cdn.pixabay.com/audio/2022/10/12/09-28-04-865_200x200.jpg"),
    ),
  ),
  AudioSource.asset(
    'assets/audios/cinematic-documentary-piano-141467.mp3',
    tag: MediaItem(
      id: 'https://pixabay.com/music/modern-classical-cinematic-documentary-piano-141467/',
      title: "Cinematic Documentary Piano",
      artist: "Dmitrii Kolesnikov",
      artUri: Uri.parse(
          "https://cdn.pixabay.com/audio/2023/03/04/09-59-51-790_200x200.jpg"),
    ),
  ),
];
