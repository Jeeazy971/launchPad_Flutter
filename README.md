# Documentation du projet LaunchPad

## Description du projet

**LaunchPad** est une application Flutter interactive permettant de jouer des sons uniques en appuyant sur des pads colorés. Ce projet est idéal pour apprendre Flutter tout en explorant des concepts de base tels que les interfaces utilisateur, les animations, et la lecture audio.

## Fonctionnalités principales

- Interface utilisateur intuitive avec des boutons colorés disposés en grille.
- Lecture de fichiers audio (MP3 et WAV) en appuyant sur les boutons.
- Changement de couleur des boutons lorsqu'ils sont activés pour une meilleure interactivité visuelle.

## Installation et configuration

### Prérequis

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)
- Un éditeur de code (comme Visual Studio Code ou Android Studio)

### Cloner le dépôt

Clonez le dépôt sur votre machine locale en utilisant la commande suivante :

```bash
git clone https://github.com/Jeeazy971/launchPad_Flutter.git
```

### Dépendances

Assurez-vous d'avoir installé toutes les dépendances nécessaires en exécutant la commande suivante à la racine du projet :

```bash
flutter pub get
```

### Structure du projet

Le projet est structuré comme suit :

```
project_launchpad/
│
├── lib/
│   ├── main.dart
│   └── launchpad.dart
│
├── assets/
│   ├── 1.mp3
│   ├── 2.mp3
│   ├── ...
│   └── 28.wav
│
├── pubspec.yaml
└── README.md
```

## Utilisation

### Exécution de l'application

Pour exécuter l'application, utilisez la commande suivante à la racine du projet :

```bash
flutter run
```

Cela lancera l'application sur l'émulateur ou l'appareil connecté.

### Interface Utilisateur

L'interface principale de l'application est composée d'une grille de boutons colorés. Chaque bouton représente un pad qui, lorsqu'il est pressé, joue un fichier audio spécifique et change de couleur brièvement.

## Code source

### main.dart

Ce fichier contient le point d'entrée principal de l'application et définit la structure de l'interface utilisateur.

```dart
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "LaunchPad",
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "LaunchPad",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.black,
          ),
          backgroundColor: Colors.black,
          body: const Center(
            child: Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [
                LaunchPad(Color(0xffADCBFC), Color(0xff067CCB), "1.mp3"),
                LaunchPad(Color(0xffff2525), Color(0xffc40050), "2.mp3"),
                // Ajoutez les autres pads ici...
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
```

### launchpad.dart

Ce fichier contient la classe `LaunchPad` qui définit le comportement des pads, y compris la lecture des sons et les animations de changement de couleur.

```dart
class LaunchPad extends StatefulWidget {
  final Color colorCenter;
  final Color colorOutline;
  final String note;

  const LaunchPad(this.colorCenter, this.colorOutline, this.note, {super.key});

  @override
  State<LaunchPad> createState() => _LaunchPadState();
}

class _LaunchPadState extends State<LaunchPad> {
  late Color _colorCenter;
  late Color _colorOutline;
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _colorCenter = widget.colorCenter;
    _colorOutline = widget.colorOutline;
  }

  void _playSound() async {
    setState(() {
      _colorCenter = Colors.white;
      _colorOutline = Colors.white;
      player.play(
        AssetSource(widget.note),
      );
    });
    await Future.delayed(
      const Duration(microseconds: 500),
    );
    setState(() {
      _colorCenter = widget.colorCenter;
      _colorOutline = widget.colorOutline;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: _playSound,
      child: Container(
        height: height / 8.2,
        width: width / 4.3,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(6.0),
          ),
          gradient: RadialGradient(
            colors: [_colorCenter, _colorOutline],
            radius: 0.5,
          ),
          boxShadow: const [
            BoxShadow(color: Colors.pink, blurRadius: 5.0),
          ],
        ),
      ),
    );
  }
}
```

## Ressources nécessaires

### Fichiers audio

Les fichiers audio doivent être placés dans le répertoire `assets/`. Assurez-vous que ces fichiers sont référencés correctement dans le fichier `pubspec.yaml`.

```yaml
flutter:
  assets:
    - assets/1.mp3
    - assets/2.mp3
    - assets/...
    - assets/28.wav
```

### Dépendances

Le projet utilise les dépendances suivantes :

- `audioplayers`: pour la lecture des fichiers audio.
- `flutter`: pour les composants de l'interface utilisateur.

Ces dépendances sont définies dans le fichier `pubspec.yaml`.

```yaml
dependencies:
  flutter:
    sdk: flutter
  audioplayers: ^6.0.0
```
