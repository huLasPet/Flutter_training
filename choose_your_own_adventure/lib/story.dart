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
