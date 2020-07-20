import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:math';

class Dice extends StatefulWidget {
  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int leftDice=1;
  int rightDice=1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: Text('Dice game',
          // textAlign: TextAlign.center, // 틀림 틀림 틀림 틀림 틀림 틀림 틀림
        ),
        centerTitle: true,      // 이거임 이거임 이거임 이거임 이거임 이거임
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded( //Expanded : 이미지를 화면에 딱! 맞게 맞춰줌
                   flex: 1,  // 남들보다n배 큰 크기!!!!!!!!!!!
                    child: Padding(
                      //패딩을 Expanded 를 감싸려니까 안됬음. 이미지 크기 그대로되던데,,
                        padding: EdgeInsets.all(20),
                        child: Image.asset('image/dice$leftDice.png'))
                ),
                Expanded( //Expanded : 이미지를 화면에 딱! 맞게 맞춰줌
                    child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Image.asset('image/dice$rightDice.png'))
                ), // 더 간결한 코드!
                //               Image(image: AssetImage('image/dice1.png'), width: 300)
              ],
            ),
            SizedBox(height: 50,),
            ButtonTheme(
                minWidth: 100,
                height: 60,
                child: RaisedButton(
                    child: Icon(Icons.play_arrow,
                      color: Colors.white,
                      size: 50,
                    ),
                    color: Colors.orangeAccent,
                    onPressed: (){
                      setState(() {
                        leftDice = Random().nextInt(6)+1;
                        rightDice = Random().nextInt(6)+1;
                      });
                      showToast('Left dice: [$leftDice] , Right dice: [$rightDice]');
                    }
                )
            )
          ],
        ),
      ),
    );
  }
}

void showToast(String message){
  Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.grey,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM
  );
}