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
  Story(
      storyTitle:
          'You decide to take the left path, which leads through a dense forest. As you make your way through the trees, you hear a rustling in the bushes. Do you:',
      choice1: 'Draw your sword',
      choice2: 'Quietly sneak away',
      path: 1,
      choice1Next: 11,
      choice2Next: 12),
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
          'As you continue on your journey your hire companions with the found wealth and defeat the sorcerer.',
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
];

//TODO: Step 23 - Use the storyNumber property inside getStory(), getChoice1() and getChoice2() so that it gets the updated story and choices rather than always just the first (0th) one.

//TODO: Step 25 - Change the storyNumber property into a private property so that only story_brain.dart has access to it. You can do this by right clicking on the name (storyNumber) and selecting Refactor -> Rename to make the change across all the places where it's used.

//TODO: Step 16 - Create a property called storyNumber which starts with a value of 0. This will be used to track which story the user is currently viewing.

//TODO: Step 17 - Create a method called nextStory(), it should not have any outputs but it should have 1 input called choiceNumber which will be the choice number (int) made by the user.

//TODO: Step 20 - Download the story plan here: https://drive.google.com/uc?export=download&id=1KU6EghkO9Hf2hRM0756xFHgNaZyGCou3

//TODO: Step 21 - Using the story plan, update nextStory() to change the storyNumber depending on the choice made by the user. e.g. if choiceNumber was equal to 1 and the storyNumber is 0, the storyNumber should become 2.

//TODO: Step 22 - In nextStory() if the storyNumber is equal to 3 or 4 or 5, that means it's the end of the game and it should call a method called restart() that resets the storyNumber to 0.

//TODO: Step 27 - Create a method called buttonShouldBeVisible() which checks to see if storyNumber is 0 or 1 or 2 (when both buttons should show choices) and return true if that is the case, else it should return false.
