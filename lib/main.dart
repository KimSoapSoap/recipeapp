import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios),
          title: Text("제목자리"),
          actions: [
            Icon(Icons.search),
            SizedBox(width: 16),
            Icon(CupertinoIcons.heart, color: Colors.redAccent),
            //보통 앱의 기본 여백공간은 16이므로
            SizedBox(width: 16)
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
            children: [
              _title(),
              SizedBox(height: 10),
              _menu(),
              SizedBox(height: 10),
              RecipeItem("burger.jpeg", "berger"),
              RecipeItem("coffee.jpeg", "coffee"),
              RecipeItem("pizza.jpeg", "pizza"),
            ],
          ),
        ));
  }

  Text _title() {
    return Text("Recipes",
        style: GoogleFonts.patuaOne(
          textStyle: TextStyle(fontSize: 30),
        ));
  }

  Row _menu() {
    return Row(
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
    );
  }

  //매개변수에 타입을 안 적으면 dynamic으로 타입추론을 하지만
  //우리가 만들어서 알고 있지 남들은 모른다. 매개변수 타입은 배려를 위해 써주자.
  //선택적 매개변수는? 안 받아도 되는 것들 혹은 매개변수가 매우 많을 때 사용.
  Container _mIcon(IconData mIcon, String text) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(30)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            mIcon,
            color: Colors.redAccent,
            size: 30,
          ),
          SizedBox(
            height: 5,
          ),
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

class RecipeItem extends StatelessWidget {
  String imageName;
  String text;

  RecipeItem(this.imageName, this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 3 / 2, // 가로 / 세로 비율
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset("assets/$imageName", fit: BoxFit.cover),
            ),
          ),
          Text(
            "$text",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "Have you ever made your own $text? Once you've tried a homemade $text, you'll never go back.",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
