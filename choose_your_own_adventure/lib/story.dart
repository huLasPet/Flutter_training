class Story {
  String storyTitle;
  String choice1;
  String choice2;
  int choice1Next;
  int choice2Next;
  int path;

  Story(
      {required this.storyTitle,
      required this.choice1,
      required this.choice2,
      required this.path,
      required this.choice1Next,
      required this.choice2Next});
}

/*
Path 2:
You decide to take the right path, which leads through a dark and gloomy swamp. As you make your way through the muck and mire, you come across a mysterious old man. Do you:
a) Ask the old man for directions
b) Ignore the old man and continue on your journey

Path 2a)
The old man tells you that the sorcerer is hiding in a castle deep within the swamp and gives you a magic amulet to protect you from the sorcerer's spells. You use the amulet to defeat the sorcerer and save the land.

Path 2b)
As you ignore the old man and continue on your journey, you come across a dragon that is blocking your path. Do you:
i) Fight the dragon
ii) Attempt to sneak past the dragon

Path 2b i)
You engage in a fierce battle with the dragon, but ultimately emerge victorious. As you continue on your journey, you find a hidden cave filled with treasure. Do you:

Take the treasure and continue on your quest
Leave the treasure and continue on your quest
Path 2b ii)
As you attempt to sneak past the dragon, it suddenly awakens and breathe fire at you. You are killed by dragon.*/
