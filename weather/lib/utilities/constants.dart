import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 90.0,
  fontWeight: FontWeight.bold,
  color: Colors.blueAccent,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 50.0,
  fontWeight: FontWeight.w500,
  color: Colors.black87,
);

const kButtonTextStyle = TextStyle(
  fontSize: 28.0,
  fontFamily: 'Spartan MB',
  fontWeight: FontWeight.w600,
  color: Colors.white,
);

const kConditionTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 90.0,
  fontWeight: FontWeight.bold,
  color: Colors.deepOrange,
);

var kInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: const Icon(
    Icons.location_city,
    color: Colors.deepOrange,
  ),
  hintText: 'Enter your city',
  hintStyle: const TextStyle(
    fontFamily: 'Spartan MB',
    color: Colors.grey,
    fontStyle: FontStyle.italic,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide.none,
  ),
);
