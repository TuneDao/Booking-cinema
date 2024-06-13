import 'package:flutter/material.dart';
import 'package:project_android/Data/model/filmmodel.dart';
import 'package:project_android/config/const.dart';

Widget itemFilmView(Film itemFilm) {
  return Container(
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(color: Colors.grey.shade200),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start, // Align items at the start
      children: [
        Image.asset(
          urlimg + itemFilm.img!,
          height: 120,
          width: 120,
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
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                  color: const Color.fromRGBO(
                      0, 173, 239, 1), // Background color of the box
                ),
                child: Text(
                  itemFilm.category ?? '',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                  color: const Color.fromRGBO(
                      0, 51, 160, 1), // Background color of the box
                ),
                child: Text(
                  itemFilm.time ?? '',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
