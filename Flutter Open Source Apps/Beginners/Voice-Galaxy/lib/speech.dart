import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechConverter extends StatefulWidget {
  @override
  State<SpeechConverter> createState() => _SpeechConverterState();
}

class _SpeechConverterState extends State<SpeechConverter> {
  late stt.SpeechToText speech;
  bool isListening = false;
  String Instruction = 'Hold the button to speak';

  @override
  void initState() {
    // TODO: implement initState
    speech = stt.SpeechToText();
    super.initState();
  }

  void listening() async {
    if (isListening == false) {
      bool available = await speech.initialize();
      if (available) {
        setState(() {
          isListening = true;
        });
        speech.listen(
            onResult: (val) => setState(() {
                  Instruction = val.recognizedWords;
                }));
      }
    } else {
      setState(() {
        isListening = false;
        speech.stop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Voice Galaxy',
            style: TextStyle(
                fontFamily: 'Pacifico', fontSize: 30.00, color: Colors.white),
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: <Color>[
                  Colors.red,
                  Colors.purple,
                  Colors.blue,
                ]),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: isListening,
        glowColor: Colors.red,
        endRadius: 75.00,
        duration: const Duration(milliseconds: 2000),
        repeatPauseDuration: const Duration(milliseconds: 100),
        repeat: true,
        child: FloatingActionButton(
          onPressed: () {
            listening();
          },
          child: Icon(isListening ? Icons.mic : Icons.mic_none),
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          padding: EdgeInsets.fromLTRB(60.00, 150.00, 30.00, 30.00),
          child: Text(
            Instruction,
            style: TextStyle(
                fontSize: 32.00,
                color: Colors.black,
                fontFamily: 'Lobster',
                fontWeight: FontWeight.normal),
          ),
        ),
      ),
    );
  }
}
