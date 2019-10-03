import 'package:flutter/material.dart';
import 'package:text_game/story_data.dart';

var data = StoryData();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  double opacityLevel = 1.0;

  void changeOpacity() {
    opacityLevel = opacityLevel == 1.0 ? 0.0 : 1.0;
  }

  void nextStory(int choiceNumber) {
    changeOpacity();
    Future.delayed(
      Duration(milliseconds: 250),
      () => setState(() {
        data.nextStory(choiceNumber);
        changeOpacity();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32.0),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/back.jpg'), fit: BoxFit.fill),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 10,
                child: Center(
                  child: AnimatedOpacity(
                    opacity: opacityLevel,
                    duration: Duration(milliseconds: 250),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Text(
                          data.getStory().storyText,
                          style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.black,
                              fontFamily: 'Neucha'),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        setState(() {
                          // data.nextStory(1);
                          nextStory(1);
                        });
                      });
                    },
                    color: Colors.green,
                    child: Text(
                      data.getStory().choiceOne,
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  child: Visibility(
                    visible: data.showButtonTwo(),
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          // data.nextStory(2);
                          nextStory(2);
                        });
                      },
                      color: Colors.red,
                      child: Text(
                        data.getStory().choiceTwo,
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
