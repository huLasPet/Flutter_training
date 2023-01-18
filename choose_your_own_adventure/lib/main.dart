import 'package:choose_your_own_adventure/glassbox.dart';
import 'package:choose_your_own_adventure/story_brain.dart';
import 'package:flutter/material.dart';

//TODO: Step 15 - Run the app and see if you can see the screen update with the first story. Delete this TODO if it looks as you expected.

void main() => runApp(const Destini());

class Destini extends StatelessWidget {
  const Destini({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const StoryPage(),
    );
  }
}

//TODO: Step 9 - Create a new storyBrain object from the StoryBrain class.

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  StoryBrain story = StoryBrain();
  int storyID = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'What will you choose?',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 30,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/fork_in_road.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: GlassBox(
                    text: story.getStory(pathID: storyID),
                    colorToUse: Colors.white.withOpacity(0.2),
                    gradientToUse: [
                      Colors.white.withOpacity(0.5),
                      Colors.white.withOpacity(0.1),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  //TODO: Step 18 - Call the nextStory() method from storyBrain and pass the number 1 as the choice made by the user.
                  onTap: () {
                    setState(
                      () {
                        storyID = story.getChoice1Next(pathID: storyID);
                      },
                    );
                  },
                  child: GlassBox(
                    //TODO: Step 13 - Use the storyBrain to get the text for choice 1.
                    text: story.getChoice1(pathID: storyID),
                    colorToUse: Colors.white.withOpacity(0.2),
                    gradientToUse: [
                      Colors.white.withOpacity(0.5),
                      Colors.white.withOpacity(0.1),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                //TODO: Step 26 - Use a Flutter Visibility Widget to wrap this FlatButton.
                //TODO: Step 28 - Set the "visible" property of the Visibility Widget to equal the output from the buttonShouldBeVisible() method in the storyBrain.
                child: GestureDetector(
                  //TODO: Step 19 - Call the nextStory() method from storyBrain and pass the number 2 as the choice made by the user.
                  onTap: () {
                    setState(
                      () {
                        storyID = story.getChoice2Next(pathID: storyID);
                      },
                    );
                  },
                  child: GlassBox(
                    //TODO: Step 14 - Use the storyBrain to get the text for choice 2.
                    text: story.getChoice2(pathID: storyID),
                    colorToUse: Colors.white.withOpacity(0.2),
                    gradientToUse: [
                      Colors.white.withOpacity(0.5),
                      Colors.white.withOpacity(0.1),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//TODO: Step 24 - Run the app and try to figure out what code you need to add to this file to make the story change when you press on the choice buttons.

//TODO: Step 29 - Run the app and test it against the Story Outline to make sure you've completed all the steps. The code for the completed app can be found here: https://github.com/londonappbrewery/destini-challenge-completed/