import 'story.dart'; // Step 6: Import the story.dart file.

class StoryBrain {
  // Step 7: Create a private list of stories called _storyData.
  final List<Story> _storyData = [
    Story(
      storyTitle: 'موتر شما در جاده ای پر پیچ و خم...',
      choice1: 'سوار میشوم، ممنون بابت کمک!',
      choice2: 'بهتره ابتدا پرسان شود که آیا او یک قاتل است؟',
    ),
    Story(
      storyTitle: 'راننده با تکان دادن سر جواب بلی داد...',
      choice1: 'حداقل بخاطر صادق بودنش سوار میشوم.',
      choice2: 'یک لحظه، بلدم تایر موتر را عوض کنم.',
    ),
    Story(
      storyTitle: 'هنگامی که شما شروع به حرکت می کنید...',
      choice1: 'من از التون جان خوشم می آید!',
      choice2: 'یا من یا او! چاقو را برمیدارید...',
    ),
    Story(
      storyTitle: 'چی؟ عجب آدم محافظه کاری!',
      choice1: 'شروع مجدد',
      choice2: '',
    ),
    Story(
      storyTitle: 'ضربه زدن با چاقو به راننده...',
      choice1: 'شروع مجدد',
      choice2: '',
    ),
    Story(
      storyTitle: 'شما با قاتل پیوند می خورید...',
      choice1: 'شروع مجدد',
      choice2: '',
    ),
  ];

  // Step 16: Create a property called storyNumber to track the current story.
  int _storyNumber = 0; // Step 25: Change storyNumber to private by prefixing with '_'.

  // Step 8: Method to return the current story title.
  String getStory() {
    return _storyData[_storyNumber].storyTitle;
  }

  // Step 11: Method to return choice 1 text.
  String getChoice1() {
    return _storyData[_storyNumber].choice1;
  }

  // Step 12: Method to return choice 2 text.
  String getChoice2() {
    return _storyData[_storyNumber].choice2;
  }

  // Step 17: Method to progress to the next story.
  void nextStory(int choiceNumber) {
    if (_storyNumber == 0 && choiceNumber == 1) {
      _storyNumber = 2;
    } else if (_storyNumber == 0 && choiceNumber == 2) {
      _storyNumber = 1;
    } else if (_storyNumber == 1 && choiceNumber == 1) {
      _storyNumber = 2;
    } else if (_storyNumber == 1 && choiceNumber == 2) {
      _storyNumber = 3;
    } else if (_storyNumber == 2 && choiceNumber == 1) {
      _storyNumber = 5;
    } else if (_storyNumber == 2 && choiceNumber == 2) {
      _storyNumber = 4;
    }

    // Step 22: Restart the story if it has ended.
    if (_storyNumber == 3 || _storyNumber == 4 || _storyNumber == 5) {
      restart();
    }
  }

  // Step 22: Method to restart the story.
  void restart() {
    _storyNumber = 0;
  }

  // Step 27: Method to check if both buttons should be visible.
  bool buttonShouldBeVisible() {
    return _storyNumber == 0 || _storyNumber == 1 || _storyNumber == 2;
  }
}
