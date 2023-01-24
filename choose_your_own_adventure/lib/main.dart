import 'package:choose_your_own_adventure/cubit/adventure_cubit.dart';
import 'package:choose_your_own_adventure/glassbox.dart';
import 'package:choose_your_own_adventure/story_brain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const Destini());

class Destini extends StatelessWidget {
  const Destini({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: BlocProvider(
        create: (context) => AdventureCubit(),
        child: const StoryPage(),
      ),
    );
  }
}

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
      body: BlocConsumer<AdventureCubit, AdventureState>(
        listener: (context, state) {
          storyID = state.nextStoryID;
        },
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(story.getBackground(pathID: storyID)),
                fit: BoxFit.cover,
              ),
            ),
            padding:
                const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
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
                          Colors.white.withOpacity(0.3),
                          Colors.white.withOpacity(0.1),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        BlocProvider.of<AdventureCubit>(context).nextStory(
                          story.getChoice1Next(pathID: storyID),
                        );
                      },
                      child: GlassBox(
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
                  Visibility(
                    visible: story.getVisibility(pathID: storyID),
                    child: Expanded(
                      child: GestureDetector(
                        onTap: () {
                          BlocProvider.of<AdventureCubit>(context).nextStory(
                            story.getChoice2Next(pathID: storyID),
                          );
                        },
                        child: GlassBox(
                          text: story.getChoice2(pathID: storyID),
                          colorToUse: Colors.white.withOpacity(0.2),
                          gradientToUse: [
                            Colors.white.withOpacity(0.5),
                            Colors.white.withOpacity(0.1),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
