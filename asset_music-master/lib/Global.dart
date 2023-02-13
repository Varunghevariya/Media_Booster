


import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

/// =================== Login Page  ===========================

  bool rememberMe  = false;
  String pass = "1234";
  String setPass = '';
  bool islogin  = false;
  bool isIntro = false;

/// =================== Home Page  ===========================

  List iconList = [
        Icon(Icons.add),
    Icon(Icons.add),
    Icon(Icons.add),

  ];
  int i = 0;
  int musicIndex  = 0;


/// =================== MusicPlay Page  ===========================

List music = [
  {
    'musicName' : 'Bandeya',
    'muImage' : 'images/bandeya.jpg',
    'music' : 'images/bandeya.mp3',
    'singer' : 'Arijit Singh'
  },
  {
    'musicName' : 'Bell',
    'muImage' : 'images/bell.jpg',
    'music' : 'images/bell.mp3',
    'singer' : 'Arijit Singh'
  },
  {
    'musicName' : 'Dekhle',
    'muImage' : 'images/dekhle.jpg',
    'music' : 'images/dekhle.mp3',
    'singer' : 'King'
  },
  {
    'musicName' : 'Dhun',
    'muImage' : 'images/dhun.jpg',
    'music' : 'images/dhun.mp3',
    'singer' : 'Arijit Singh'
  },
  {
    'musicName' : 'Hundi',
    'muImage' : 'images/hundi.jpg',
    'music' : 'images/hundi.mp3',
    'singer' : 'Arijit Singh'
  },
  {
    'musicName' : 'Jaan',
    'muImage' : 'images/jaan.jpg',
    'music' : 'images/jaan.mp3',
    'singer' : 'King'
  },
  {
    'musicName' : 'Jhoome',
    'muImage' : 'images/jhoome.jpg',
    'music' : 'images/jhoome.mp3',
    'singer' : 'Arijit Singh'
  },
  {
    'musicName' : 'Kesariya',
    'muImage' : 'images/kesariya.jpg',
    'music' : 'images/kesariya.mp3',
    'singer' : 'Arijit Singh'
  },
  {
    'musicName' : 'Maan',
    'muImage' : 'images/maan.jpg',
    'music' : 'images/maan.mp3',
    'singer' : 'King'
  },
  {
    'musicName' : 'Oops',
    'muImage' : 'images/oops.jpg',
    'music' : 'images/oops.mp3',
    'singer' : 'Arijit Singh'
  },
  {
    'musicName' : 'Paan',
    'muImage' : 'images/paan.jpg',
    'music' : 'images/paan.mp3',
    'singer' : 'King'
  },
  {
    'musicName' : 'Sooraj',
    'muImage' : 'images/sooraj.jpg',
    'music' : 'images/sooraj.mp3',
    'singer' : 'King'
  },
];
bool start = false;
final assetsAudioPlayer = AssetsAudioPlayer();

/// =================== Videoplay Page  ===========================

List Video = [
  {
    'image' : 'images/s1.png',
    'path': 'https://cdn.pixabay.com/vimeo/778907198/Christmas%20-%20141964.mp4?width=640&hash=85c931219de800ff2e651bf0e82b092b6f6cc1f4'

  },
  {
    'image' : 'images/s2.png',
    'path': 'https://cdn.pixabay.com/vimeo/780232342/Pine%20-%20142579.mp4?width=640&hash=9cfa186f22b9e3f53005808ee34d747f647a600a'

  },
  {
    'image' : 'images/s3.png',
    'path': 'https://cdn.pixabay.com/vimeo/629483574/Aurora%20Borealis%20-%2090877.mp4?width=960&hash=e3b680ed14a44dd77b91f4c628e775f546501865'

  },
  {
    'image' : 'images/s4.png',
    'path': 'https://cdn.pixabay.com/vimeo/635675488/Mountains%20-%2091545.mp4?width=1280&hash=583fb2d1b01533ce77d3febc67a34b076a8d2d76'

  },
  {
    'image' : 'images/s5.png',
    'path': 'https://cdn.pixabay.com/vimeo/635675488/Mountains%20-%2091545.mp4?width=1280&hash=583fb2d1b01533ce77d3febc67a34b076a8d2d76'

  },
  {
    'image' : 'images/s6.png',
    'path': 'https://cdn.pixabay.com/vimeo/764361528/Ocean%20-%20135658.mp4?width=1280&hash=f64da4baec74c288939381fc4993230aa8589c80'

  },
];
