import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  /// For most animation you should declare Animation and AnimationController
  late final Animation<double> _animation;
  late final AnimationController _animationController;

  /// Define them in your init State
  @override
  void initState() {
    /// AnimationController is defined like this, and you can specify the time of the animtoin here
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    /// Animation is defined like this, Tween means "Between", it takes the two values the your animation
    /// is going to travel through
    /// Here your animation is travelling from 0 to 1.
    _animation =
        Tween<double>(begin: 0, end: 1.0).animate(_animationController);
    super.initState();
  }

  /// Don't forget to dispose your AnimationController once the widget is disposed, like this:
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animationController.repeat(reverse: true);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        /// Use animated Icon
        child: AnimatedIcon(
          /// The two icons you are using(play and pause)
          icon: AnimatedIcons.play_pause,

          /// It receives Animation<double>, the progress will start from 0 to 1
          progress: _animation,

          size: MediaQuery.of(context).size.width,
          color: Colors.black,
        ),
      ),
    );
  }
}
