class Story {
  String storyTitle;
  String choice1;
  String choice2;
  int choice1Next;
  int choice2Next;
  int path;
  String background;

  Story(
      {required this.storyTitle,
      required this.choice1,
      required this.choice2,
      required this.path,
      required this.choice1Next,
      required this.choice2Next,
      this.background = 'images/fork_in_road.png'});
}
//TODO: Add background to each object
//TODO: Add visibility option so when there is an ending the 2nd button is not visible
