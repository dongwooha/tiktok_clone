import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:titok_clone/constants/gaps.dart';
import 'package:titok_clone/constants/sizes.dart';

enum Direction { right, left }

enum Page { first, second }

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({Key? key}) : super(key: key);

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  Direction _direction = Direction.right;
  Page _showingPage = Page.first;

  void _onPanUpdate(DragUpdateDetails details) {
    print(details);
    if (details.delta.dx > 0) {
      setState(() {
        _direction = Direction.right;
      });
    } else {
      setState(() {
        _direction = Direction.left;
      });
    }
  }

  void _onPanEnd(DragEndDetails details) {
    if (_direction == Direction.left) {
      setState(() {
        _showingPage = Page.second;
      });
    } else {
      setState(() {
        _showingPage = Page.first;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onPanUpdate: _onPanUpdate,
        onPanEnd: _onPanEnd,
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size24,
              ),
              child: AnimatedCrossFade(
                firstChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Gaps.v52,
                    Text(
                      "Watch cool videos!",
                      style: TextStyle(
                        fontSize: Sizes.size40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gaps.v24,
                    Text(
                      "Videos are personalized for you based on what you watch, like, and share.",
                      style: TextStyle(
                        fontSize: Sizes.size20,
                      ),
                    )
                  ],
                ),
                secondChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Gaps.v52,
                    Text(
                      "Follow the rules",
                      style: TextStyle(
                        fontSize: Sizes.size40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gaps.v24,
                    Text(
                      "Videos are personalized for you based on what you watch, like, and share.",
                      style: TextStyle(
                        fontSize: Sizes.size20,
                      ),
                    )
                  ],
                ),
                crossFadeState: _showingPage == Page.first
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(
                  milliseconds: 300,
                ),
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Sizes.size24,
                horizontal: Sizes.size24,
              ),
              child: AnimatedOpacity(
                duration: const Duration(microseconds: 300),
                opacity: _showingPage == Page.first ? 0 : 1,
                child: CupertinoButton(
                  onPressed: () {},
                  color: Theme.of(context).primaryColor,
                  child: const Text("Enter the app!"),
                ),
              ),
            ),
          ),
        ));
  }
}


// return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         body: SafeArea(
//           child: TabBarView(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: const [
//                     Gaps.v52,
//                     Text(
//                       "Watch cool videos!",
//                       style: TextStyle(
//                         fontSize: Sizes.size40,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Gaps.v24,
//                     Text(
//                       "Videos are personalized for you based on what you watch, like, and share.",
//                       style: TextStyle(
//                         fontSize: Sizes.size20,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: const [
//                     Gaps.v52,
//                     Text(
//                       "Follow the rules!",
//                       style: TextStyle(
//                         fontSize: Sizes.size40,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Gaps.v24,
//                     Text(
//                       "Videos are personalized for you based on what you watch, like, and share.",
//                       style: TextStyle(
//                         fontSize: Sizes.size20,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: const [
//                     Gaps.v52,
//                     Text(
//                       "Enjoy!",
//                       style: TextStyle(
//                         fontSize: Sizes.size40,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Gaps.v24,
//                     Text(
//                       "Videos are personalized for you based on what you watch, like, and share.",
//                       style: TextStyle(
//                         fontSize: Sizes.size20,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         bottomNavigationBar: BottomAppBar(
//           child: Container(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(
//                 vertical: Sizes.size24,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   TabPageSelector(
//                     selectedColor: Theme.of(context).primaryColor,
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }