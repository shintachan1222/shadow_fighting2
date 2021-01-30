import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

class Homepage extends StatefulWidget {
  Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Soundpool _soundpool;
  List<int> _soundIds = [0, 0, 0, 0, 0, 0];
  List<String> _texts = ['ドスッ', 'バシッ', 'ザシュ', 'ブスッ', 'バキューン', 'ドカーン'];

  @override
  void initState() {
    super.initState();
    _initSound();
    print('ビルド終わり');
  }

  Future<void> _initSound() async {
    _soundpool = Soundpool();

    _soundIds[0] = await loadSound('assets/sounds/Hit09-1.mp3');
    _soundIds[1] = await loadSound('assets/sounds/Hit08-1.mp3');
    _soundIds[2] = await loadSound('assets/sounds/Cut01-1.mp3');
    _soundIds[3] = await loadSound('assets/sounds/Cut04-1.mp3');
    _soundIds[4] = await loadSound('assets/sounds/Gunshot01-1.mp3');
    _soundIds[5] = await loadSound('assets/sounds/Cannon01-1.mp3');

    print('ロード終わり');

    setState(() {});
  }

  Future<int> loadSound(String soundPath) {
    return rootBundle.load(soundPath).then((value) => _soundpool.load(value));
  }

  @override
  void dispose() {
    _soundpool.release();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("シャドウファイティング"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child: _soundbutton(_texts[0], _soundIds[0])),
                  Expanded(child: _soundbutton(_texts[1], _soundIds[1]))
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child: _soundbutton(_texts[2], _soundIds[2])),
                  Expanded(child: _soundbutton(_texts[3], _soundIds[3]))
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child: _soundbutton(_texts[4], _soundIds[4])),
                  Expanded(child: _soundbutton(_texts[5], _soundIds[5]))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _soundbutton(String displaytext, int soundId) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: RaisedButton(
        onPressed: () => _playSound(soundId),
        child: Text(displaytext),
      ),
    );
  }

  _playSound(int soundId) {
    _soundpool.play(soundId);
  }
}
