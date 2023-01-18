import 'package:choose_your_own_adventure/story.dart';

class StoryBrain {
  String getStory({pathID}) {
    var firstStory = _storyData.where((element) => element.path == pathID);
    return firstStory.first.storyTitle;
  }

  String getChoice1({pathID}) {
    var firstStory = _storyData.where((element) => element.path == pathID);
    return firstStory.first.choice1;
  }

  int getChoice1Next({pathID}) {
    var firstStory = _storyData.where((element) => element.path == pathID);
    return firstStory.first.choice1Next;
  }

  int getChoice2Next({pathID}) {
    var firstStory = _storyData.where((element) => element.path == pathID);
    return firstStory.first.choice2Next;
  }

  String getChoice2({pathID}) {
    var firstStory = _storyData.where((element) => element.path == pathID);
    return firstStory.first.choice2;
  }

  String getBackground({pathID}) {
    var firstStory = _storyData.where((element) => element.path == pathID);
    return firstStory.first.background;
  }
}

//TODO: Add appBar text and picture path to the Story object as well
List<Story> _storyData = [
  Story(
      storyTitle:
          'You are a brave adventurer, embarking on a journey to defeat an evil sorcerer who has been terrorizing the land. As you set out on your quest, you come across a fork in the road.',
      choice1: 'Go left.',
      choice2: 'Go right',
      path: 0,
      choice1Next: 1,
      choice2Next: 2),

  //Path 1 start
  Story(
      storyTitle:
          'You decide to take the left path, which leads through a dense forest. As you make your way through the trees, you hear a rustling in the bushes. Do you:',
      choice1: 'Draw your sword',
      choice2: 'Quietly sneak away',
      path: 1,
      choice1Next: 11,
      choice2Next: 12,
      background: 'images/forest.png'),
  Story(
      storyTitle:
          'As you draw your sword, a group of bandits jumps out from the bushes, demanding that you hand over all of your possessions. Do you:',
      choice1: 'Fight the bandits',
      choice2: 'Give them what they want',
      path: 11,
      choice1Next: 111,
      choice2Next: 112),
  Story(
      storyTitle:
          'You engage in a fierce battle with the bandits, but ultimately emerge victorious. As you continue on your journey, you find a chest filled with gold and precious jewels. Do you:',
      choice1: 'Take the treasure',
      choice2: 'Leave the treasure',
      path: 111,
      choice1Next: 1111,
      choice2Next: 1112),
  Story(
      storyTitle:
          'As you continue on your journey your hire companions with the newfound wealth and defeat the sorcerer.',
      choice1: 'The end',
      choice2: 'Restart',
      path: 1111,
      choice1Next: 0,
      choice2Next: 0),
  Story(
      storyTitle:
          'As you continue on your journey you are unable to bolster the strength of your group and get defeated by the sorcerer.',
      choice1: 'The end',
      choice2: 'Restart',
      path: 1112,
      choice1Next: 0,
      choice2Next: 0),
  Story(
      storyTitle:
          'The bandits take your possessions and leave you for dead. With nothing left to lose, you continue on your journey with a newfound determination to defeat the sorcerer and reclaim what is rightfully yours.',
      choice1: 'The end',
      choice2: 'Restart',
      path: 112,
      choice1Next: 0,
      choice2Next: 0),
  Story(
      storyTitle:
          'You quietly sneak away and avoid the bandits. As you continue on your journey, you come across a clearing where you see a magical horse grazing. Do you:',
      choice1: 'Try to steal the horse',
      choice2: 'Ask if it will help you',
      path: 12,
      choice1Next: 121,
      choice2Next: 122),
  Story(
      storyTitle:
          'As you try to steal the horse, it suddenly turns and rears up, revealing itself to be a powerful unicorn. The unicorn uses its magic to transport you to a hidden temple where you find a powerful magic sword. You use the sword to defeat the sorcerer and save the land.',
      choice1: 'The end',
      choice2: 'Restart',
      path: 121,
      choice1Next: 0,
      choice2Next: 0),
  Story(
      storyTitle:
          'The horse, sensing your noble intentions, agrees to take you on your journey. Together, you defeat the sorcerer and save the land.',
      choice1: 'The end',
      choice2: 'Restart',
      path: 122,
      choice1Next: 0,
      choice2Next: 0),
  //Path 1 end
  //Path 2 start
  Story(
      storyTitle:
          'You decide to take the right path, which leads through a dark and gloomy swamp. As you make your way through the muck and mire, you come across a mysterious old man. Do you:',
      choice1: 'Ask the old man for directions',
      choice2: 'Ignore the old man',
      path: 2,
      choice1Next: 21,
      choice2Next: 22),
  Story(
      storyTitle:
          'The old man tells you that the sorcerer is hiding in a castle deep within the swamp and gives you a magic amulet to protect you from the sorcerer\'s spells. You use the amulet to defeat the sorcerer and save the land.',
      choice1: 'The end',
      choice2: 'Restart',
      path: 21,
      choice1Next: 0,
      choice2Next: 0),
  Story(
      storyTitle:
          'As you ignore the old man and continue on your journey, you come across a dragon that is blocking your path. Do you:',
      choice1: 'Fight the dragon',
      choice2: 'Attempt to sneak past it',
      path: 22,
      choice1Next: 221,
      choice2Next: 222),
  Story(
      storyTitle:
          'You engage in a fierce battle with the dragon, but ultimately emerge victorious. As you continue on your journey, you find a hidden cave filled with treasure. Do you:',
      choice1: 'Take the treasure',
      choice2: 'Leave the treasure',
      path: 221,
      //Pointing to the other path since this would be the same ending
      choice1Next: 1111,
      choice2Next: 1112),
  Story(
      storyTitle:
          'As you attempt to sneak past the dragon, it suddenly awakens and breathe fire at you. You are killed by dragon.',
      choice1: 'The end',
      choice2: 'Restart',
      path: 222,
      choice1Next: 0,
      choice2Next: 0),
  //Path 2 end
];

//TODO: Step 27 - Create a method called buttonShouldBeVisible() which checks to see if storyNumber is 0 or 1 or 2 (when both buttons should show choices) and return true if that is the case, else it should return false.
