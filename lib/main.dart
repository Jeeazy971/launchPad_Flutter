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
                LaunchPad(Color(0xffADCBFC), Color(0xff067CCB), "3.mp3"),
                LaunchPad(Color(0xffE247FC), Color(0xffA23AB7), "4.mp3"),
                LaunchPad(Color(0xffADCBFC), Color(0xff067CCB), "5.mp3"),
                LaunchPad(Color(0xffff2525), Color(0xffc40050), "6.mp3"),
                LaunchPad(Color(0xffADCBFC), Color(0xff067CCB), "7.mp3"),
                LaunchPad(Color(0xffE247FC), Color(0xffA23AB7), "8.mp3"),
                LaunchPad(Color(0xffADCBFC), Color(0xff067CCB), "9.mp3"),
                LaunchPad(Color(0xffff2525), Color(0xffc40050), "10.mp3"),
                LaunchPad(Color(0xffADCBFC), Color(0xff067CCB), "11.mp3"),
                LaunchPad(Color(0xffE247FC), Color(0xffA23AB7), "12.mp3"),
                LaunchPad(Color(0xffADCBFC), Color(0xff067CCB), "13.mp3"),
                LaunchPad(Color(0xffff2525), Color(0xffc40050), "14.mp3"),
                LaunchPad(Color(0xffADCBFC), Color(0xff067CCB), "15.mp3"),
                LaunchPad(Color(0xffE247FC), Color(0xffA23AB7), "16.mp3"),
                LaunchPad(Color(0xffADCBFC), Color(0xff067CCB), "17.mp3"),
                LaunchPad(Color(0xffff2525), Color(0xffc40050), "18.mp3"),
                LaunchPad(Color(0xffADCBFC), Color(0xff067CCB), "19.mp3"),
                LaunchPad(Color(0xffE247FC), Color(0xffA23AB7), "20.wav"),
                LaunchPad(Color(0xffADCBFC), Color(0xff067CCB), "21.mp3"),
                LaunchPad(Color(0xffff2525), Color(0xffc40050), "22.wav"),
                LaunchPad(Color(0xffADCBFC), Color(0xff067CCB), "23.wav"),
                LaunchPad(Color(0xffE247FC), Color(0xffA23AB7), "24.wav"),
                LaunchPad(Color(0xffADCBFC), Color(0xff067CCB), "25.wav"),
                LaunchPad(Color(0xffff2525), Color(0xffc40050), "26.wav"),
                LaunchPad(Color(0xffADCBFC), Color(0xff067CCB), "27.wav"),
                LaunchPad(Color(0xffE247FC), Color(0xffA23AB7), "28.wav"),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

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
