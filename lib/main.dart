import 'package:flutter/material.dart';
import 'story_brain.dart'; // Step 6: Import the story_brain.dart file.

void main() => runApp(Destiny());

class Destiny extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

// Step 9: Create a new storyBrain object from the StoryBrain class.
StoryBrain storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Step 1: Add a linear gradient background to the container.
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey[300]!, Colors.pink[900]!, Colors.deepPurple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    // Step 10: Use the storyBrain to get the first story title.
                    storyBrain.getStory(),
                    // Step 30.A: Display text in a right-to-left direction.
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: () {
                    // Step 18: Call the nextStory() method from storyBrain for choice 1.
                    setState(() {
                      storyBrain.nextStory(1);
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.purple[700],
                    // Step 31.A: Use shape property for rounded corners.
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                  ),
                  child: Text(
                    // Step 13: Use storyBrain to get the text for choice 1.
                    storyBrain.getChoice1(),
                    // Step 30.B: Display text in a right-to-left direction.
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Expanded(
                flex: 2,
                // Step 26: Wrap this TextButton in a Visibility widget.
                child: Visibility(
                  // Step 28: Set visibility based on buttonShouldBeVisible().
                  visible: storyBrain.buttonShouldBeVisible(),
                  child: TextButton(
                    onPressed: () {
                      // Step 19: Call nextStory() method for choice 2.
                      setState(() {
                        storyBrain.nextStory(2);
                      });
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.pink,
                      // Step 31.B: Use shape property for rounded corners.
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                    ),
                    child: Text(
                      // Step 14: Use storyBrain to get the text for choice 2.
                      storyBrain.getChoice2(),
                      // Step 30.B: Display text in a right-to-left direction.
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
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
