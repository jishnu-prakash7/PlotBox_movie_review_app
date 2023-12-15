// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plotbox/widgets/privacypolicy_and_termsandconditions_ref.dart';

class aboutUsScreen extends StatelessWidget {
  const aboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  'About Us',
                  style: GoogleFonts.ubuntu(
                      textStyle: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              ),
              privacyandtermsContent(
                  'Welcome to PlotBox, Your Movie Review Companion!'),
              privacyandtermsHeading('What is PlotBox?'),
              privacyandtermsContent(
                  'PlotBox is more than just a movie review app; it s your gateway to the world of cinema. Whether youre a seasoned film buff or just looking for your movies , PlotBox has you covered. Explore, rate, and share your thoughts on the movies and timeless classics.'),
              privacyandtermsHeading('Our Mission'),
              privacyandtermsContent(
                  'At PlotBox, we are on a mission to create a community of movie enthusiasts who share their passion for cinema. We believe in the power of storytelling and the impact it has on our lives. Our goal is to provide a platform where discover new films.'),
              privacyandtermsHeading('Features:'),
              privacyandtermsContent(
                  '◉ Discover Movies: Explore a vast collection of movies from various genres and hidden gems.'),
              privacyandtermsContent(
                  '◉ Comment : Share your insights by commenting movies . Your opinion matters!'),
              privacyandtermsHeading('Contact Us'),
              privacyandtermsContent(
                  'have questions, suggestions, or just want to say hello?connect with plotbox@gmail.com. Wed love to hear from you!,'),
              privacyandtermsContent(
                  'Thank you for being a part of the PlotBox community. Lets celebrate the magic of cinema together!'),
              privacyandtermsContent('Happy Watching,\nThe PlotBox Team')
            ],
          ),
        ),
      ),
    ));
  }
}
