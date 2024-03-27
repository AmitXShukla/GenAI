// Copyright 2021 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

// NavigationRail shows if the screen width is greater or equal to
// narrowScreenWidthThreshold; otherwise, NavigationBar is used for navigation.
const double narrowScreenWidthThreshold = 450;

const double mediumWidthBreakpoint = 1000;
const double largeWidthBreakpoint = 1500;

const double transitionLength = 500;

const cAppTitle = "Manualify";
// ignore: camel_case_types
enum cMessageType { error, success }
const cBodyText = TextStyle(
  fontWeight: FontWeight.w400,
  color: Colors.blueGrey,
);
const cErrorText = TextStyle(
  fontWeight: FontWeight.w400,
  color: Colors.red,
);
const cWarnText = TextStyle(
  fontWeight: FontWeight.w400,
  color: Colors.yellow,
);
const cSuccessText = TextStyle(
  fontWeight: FontWeight.w400,
  color: Colors.green,
);

const cNavText = TextStyle(
    color: Colors.blueAccent,
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal);

const cHeaderText = TextStyle(
    color: Colors.blueAccent,
    fontSize: 20.0,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal);

class CustomSpinner extends StatelessWidget {
  final bool toggleSpinner;
  const CustomSpinner({super.key, required this.toggleSpinner});

  @override
  Widget build(BuildContext context) {
    return Center(child: toggleSpinner ? const CircularProgressIndicator() : null);
  }
}

class CustomMessage extends StatelessWidget {
  final bool toggleMessage;
  // ignore: prefer_typing_uninitialized_variables
  final toggleMessageType;
  final String toggleMessageTxt;
  const CustomMessage(
      {super.key,
      required this.toggleMessage,
      this.toggleMessageType,
      required this.toggleMessageTxt})
      : super();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: toggleMessage
            ? Text(toggleMessageTxt,
                style: toggleMessageType == cMessageType.error.toString()
                    ? cErrorText
                    : cSuccessText)
            : null);
  }
}

PreferredSizeWidget createCustomAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.menu),
        // onPressed: () { Scaffold.of(context).openDrawer(); },
        onPressed: () { Navigator.pushNamed(
                  context,
                  '/',
                );},
        tooltip: "Home",
      ),
      title: const Text(cAppTitle),
      actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.power),
            tooltip: 'about us',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Powered by GenAI Apps  github.com/AmitXShukla')));
            },
          ),
          IconButton(
            icon: const Icon(Icons.youtube_searched_for_outlined),
            tooltip: 'contact',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('X.com/ashuklax | youtube.com/@amit.shukla')));
            },
          ),
          // IconButton(
          //   icon: const Icon(Icons.navigate_next),
          //   tooltip: 'Go to the next page',
          //   onPressed: () {
          //     Navigator.push(context, MaterialPageRoute<void>(
          //       builder: (BuildContext context) {
          //         return Scaffold(
          //           appBar: AppBar(
          //             title: const Text('Next page'),
          //           ),
          //           body: const Center(
          //             child: Text(
          //               'This is the next page',
          //               style: TextStyle(fontSize: 24),
          //             ),
          //           ),
          //         );
          //       },
          //     ));
          //   },
          // ),
        ],
      );
  }


// Whether the user has chosen a theme color via a direct [ColorSeed] selection,
// or an image [ColorImageProvider].
enum ColorSelectionMethod {
  colorSeed,
  image,
}

enum ColorSeed {
  baseColor('M3 Baseline', Color(0xff6750a4)),
  indigo('Indigo', Colors.indigo),
  blue('Blue', Colors.blue),
  teal('Teal', Colors.teal),
  green('Green', Colors.green),
  yellow('Yellow', Colors.yellow),
  orange('Orange', Colors.orange),
  deepOrange('Deep Orange', Colors.deepOrange),
  pink('Pink', Colors.pink);

  const ColorSeed(this.label, this.color);
  final String label;
  final Color color;
}

enum ColorImageProvider {
  leaves('Leaves',
      'https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_1.png'),
  peonies('Peonies',
      'https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_2.png'),
  bubbles('Bubbles',
      'https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_3.png'),
  seaweed('Seaweed',
      'https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_4.png'),
  seagrapes('Sea Grapes',
      'https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_5.png'),
  petals('Petals',
      'https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_6.png');

  const ColorImageProvider(this.label, this.url);
  final String label;
  final String url;
}

enum ScreenSelected {
  component(0),
  color(1),
  typography(2),
  elevation(3);

  const ScreenSelected(this.value);
  final int value;
}