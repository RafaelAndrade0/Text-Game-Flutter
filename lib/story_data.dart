import 'package:text_game/story.dart';

class StoryData {
  int _storyNumber = 0;
  List<Story> _storyData = [
    Story(
        storyText:
            'Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: "Need a ride, boy?".',
        choiceOne: 'I\'ll hop in. Thanks for the help!',
        choiceTwo: 'Better ask him if he\'s a murderer first.'),
    Story(
        storyText: 'He nods slowly, unphased by the question.',
        choiceOne: 'At least he\'s honest. I\'ll climb in.',
        choiceTwo: 'Wait, I know how to change a tire.'),
    Story(
        storyText:
            'As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.',
        choiceOne: 'I love Elton John! Hand him the cassette tape.',
        choiceTwo: 'It\'s him or me! You take the knife and stab him.'),
    Story(
        storyText:
            'What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?',
        choiceOne: 'Restart',
        choiceTwo: ''),
    Story(
        storyText:
            'As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.',
        choiceOne: 'Restart',
        choiceTwo: ''),
    Story(
        storyText:
            'You bond with the murderer while crooning verses of "Can you feel the love tonight". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: "Try the pier".',
        choiceOne: 'Restart',
        choiceTwo: '')
  ];

  Map<int, Map<int, int>> choices = {
    0: {1: 2, 2: 1},
    1: {1: 2, 2: 3},
    2: {1: 5, 2: 4},
  };

  void restartStory() {
    _storyNumber = 0;
  }

  void nextStory(int choiceNumber) {
    List<int> endStory = [3, 4, 5];

    if (endStory.contains(_storyNumber)) {
      restartStory();
    } else {
      _storyNumber = choices[_storyNumber][choiceNumber];
    }
  }

  Story getStory() {
    return _storyData[_storyNumber];
  }

  bool showButtonTwo() {
    return _storyData[_storyNumber].choiceTwo.isNotEmpty;
  }
}
