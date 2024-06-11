import 'package:flutter/material.dart';
import 'package:project_android/Data/model/filmmodel.dart';
import 'package:project_android/config/const.dart';

Widget itemFilmView(Film itemFilm) {
  return Container(
    padding: const EdgeInsets.all(15),
    margin: const EdgeInsets.symmetric(vertical: 5),
    decoration: BoxDecoration(color: Colors.grey.shade200),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start, // Align items at the start
      children: [
        Image.asset(
          urlimg + itemFilm.img!,
          height: 120,
          width: 60,
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.image),
        ),
        const SizedBox(
          width: 20,
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemFilm.name ?? '',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5), // Add some space between the texts
              Text(
                itemFilm.category ?? '',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
