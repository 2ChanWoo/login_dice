import 'package:flutter/material.dart';
import 'Dice.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Login(title: 'Login'),
    );
  }
}

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    TextEditingController controller2 = TextEditingController();
    //사용 후 리소스 낭비 방지 위하여 dispose method 를 사용해야함!!!!!!!

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Builder(
        builder: (context) {
          return GestureDetector(
            //onpress 버튼에서의 상호작용(이벤트)
            //onTap 버튼을 비롯한 모든 이벤트를 구현할 때 사용 (길게누르기 드래그 등)
            onTap: (){
              // FocusScope.of 로 현재 택스트 필드와 연결되어있는 포커스 노드를 찾아,
              // unfocus로 포커스를 사라지게 한다.
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top:50)),
                  Center(
                    child: Image(image: AssetImage('image/chef.gif'),
                      width: 170,
                      height: 190,
                    ),
                  ),
                  Form(
                      child: Theme(
                          data: ThemeData(
                              primaryColor: Colors.teal,
                              inputDecorationTheme: InputDecorationTheme( //레이블 label
                                  labelStyle: TextStyle(
                                      color: Colors.teal,
                                      fontSize: 15
                                  )
                              )
                          ),
                          child: Container(
                            padding: EdgeInsets.all(40),
                            //하나의 차일드밖에 가질 수 없음.
                            //따라서 3가지 이상을 가지려면 Column이 필요!
                            child: Column(
                              children: <Widget>[
                                TextField(
                                  controller: controller,
                                  decoration: InputDecoration(
                                      labelText: 'Enter "dice"'
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  //emailAddress : @가 포함된 키보드!
                                ),
                                TextField(
                                  controller: controller2,
                                  decoration: InputDecoration(
                                      labelText: 'Enter Pasword'
                                  ),
                                  keyboardType: TextInputType.text,
                                  //emailAddress : @가 포함된 키보드!
                                  obscureText: true,  //보안 ***로 문자 표시!
                                ),
                                SizedBox(height:  40,),
                                ButtonTheme(
                                    minWidth: 100,
                                    height: 50,
                                    child: RaisedButton(
                                        color: Colors.orangeAccent,
                                        // onPressed 에 기능이 null 이면 색지정이 되지 않음!!!
                                        child: Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                          size: 35,
                                        ),
                                        onPressed: (){
                                          // onPressed 에 기능이 null 이면 색지정이 되지 않음!!!
                                          if(controller.text == 'dice' && controller2.text=='1234'){
                                            Navigator.push(context,
                                                MaterialPageRoute(builder: (BuildContext context)=>Dice()));
                                          }
                                          else if(controller.text == 'dice' && controller2.text!='1234'){
                                            showSnackBar2(context);
                                          }
                                          else if(controller.text != 'dice' && controller2.text=='1234'){
                                            showSnackBar3(context);
                                          }
                                          else{
                                //            showSnackBar(context);
                                            Navigator.push(context,
                                               MaterialPageRoute(builder: (BuildContext context)=>Dice()));
                               //    주석풀면, 무조건 로그인되는데....
                                        }

                                        }
                                    )
                                ),
                              ],
                            ),
                          )))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

void showSnackBar(BuildContext context){
  Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('로그인 정보를 다시 확인하세요',
          textAlign: TextAlign.center,
        ),
        duration: Duration(milliseconds: 1800),
        backgroundColor: Colors.redAccent,
      )
  );
}

void showSnackBar2(BuildContext context){
  Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('비밀번호가 일치하지 않습니다.',
          textAlign: TextAlign.center,
        ),
        duration: Duration(milliseconds: 1800),
        backgroundColor: Colors.redAccent,
      )
  );
}

void showSnackBar3(BuildContext context){
  Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('dice의 철자를 확인하세요',
          textAlign: TextAlign.center,
        ),
        duration: Duration(milliseconds: 1800),
        backgroundColor: Colors.redAccent,
      )
  );
}