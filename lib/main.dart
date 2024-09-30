import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

/*
Dart는 fort문에서 { }중괄호를 안 붙이면 표현식(expression)이 된다. 즉, 리턴한다는 것!
배열 안에서 조건문이나 for문 사용이 가능하다.
var list = [for(int i = 1; i<=10; i++) i] 이렇게 하면 { }중괄호가 없으므로 i가 return된다.
 print(list); ->  [1,2,...9,10]
*/

// 하나의 화면
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: [
            Text("Recipes", style: TextStyle(fontSize: 30)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _mIcon(Icons.food_bank, "ALL"),
                SizedBox(width: 25),
                _mIcon(Icons.emoji_food_beverage, "ALL"),
                SizedBox(width: 25),
                _mIcon(Icons.fastfood, "ALL"),
                SizedBox(width: 25),
                _mIcon(Icons.local_pizza, "ALL"),
              ],
            )
          ],
        ));
  }


  //매개변수에 타입을 안 적으면 dynamic으로 타입추론을 한다.
  Container _mIcon(mIcon, text) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(30)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            mIcon,
            color: Colors.redAccent,
            size: 30,
          ),
          SizedBox(height: 5,),
          Text(
            //문자열이 null이면 터지기 때문에 "" 안에 $변수로 넣어준다.
            "$text",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
