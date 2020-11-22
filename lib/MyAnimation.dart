import 'package:audioplayers/audio_cache.dart';
//import 'package:audioplayers/audioplayers.dart';
//import 'dart:math';
import 'package:flutter/material.dart';
class MyAnimation extends StatefulWidget {
  @override
  _MyAnimationState createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation> with SingleTickerProviderStateMixin{
  var myanicon;
  var animation;
  @override
  void initState(){
    super.initState();
    myanicon=AnimationController(vsync:this,duration: Duration(seconds: 2) );
    print(animation);
    //animation=CurvedAnimation(curve: Curves.easeIn,parent: myanicon)
    //..addListener(() {
    //  setState((){
    //    print(animation.value);
    //  });
    //});
    animation=ColorTween(begin: Colors.indigo ,end:Colors.orange).animate(myanicon)
    ..addListener(() {
      setState((){

      });
    });
    
    //myanicon.forward();
    print(animation);
  }
  var num=0;
  bool toggleButton=true;
  void animatedColor(){
    if(toggleButton){
      myanicon.forward();
    }else{
      myanicon.reverse();
    }
    toggleButton=!toggleButton;
    
  }
  
  @override
  void dispose(){
    super.dispose();
    myanicon.dispose();
  }

  //final Color mycolor=UniqueColorGenerator.getColor();
  @override
  Widget build(BuildContext context) {
    
    AudioCache audioCache=AudioCache();

    void playAudio()async{
      audioCache.play('ring.wav');
    }
    

    return Scaffold(
      appBar: AppBar(
        title: Text("Internshala App"),
        backgroundColor: Colors.green,
      ),
      body: GridView.count(crossAxisCount: 5,
      children:List.generate(25, (index) {
        return Card(
          elevation: 10,
          color: animation.value,
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            child: ListTile(onTap: (){
              animatedColor();
              playAudio();
              print("hello");
            },),
            ),
        );
      }),
      ),
    );
  }
}
