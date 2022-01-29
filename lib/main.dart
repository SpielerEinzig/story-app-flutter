import 'package:flutter/material.dart';
import 'package:story_app/story_brain.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

StoryBrain storyBrain = StoryBrain();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    storyBrain.getStory(),
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      storyBrain.nextStory(1);
                    });
                  },
                  child: Text(
                    storyBrain.getChoice1(),
                    style: const TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Visibility(
                visible: storyBrain.buttonShouldBeVisible(),
                child: Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        storyBrain.nextStory(2);
                      });
                    },
                    child: Text(
                      storyBrain.getChoice2(),
                      style: const TextStyle(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
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
