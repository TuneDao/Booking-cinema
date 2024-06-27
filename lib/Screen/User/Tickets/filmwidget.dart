import 'package:flutter/material.dart';
import 'package:project_android/Data/model/filmmodel.dart';
import 'filmbody.dart';
import '../../../Data/provider/filmprovider.dart';

class FilmWidget extends StatefulWidget {
  const FilmWidget({super.key});

  @override
  State<FilmWidget> createState() => _FilmWidgetState();
}

class _FilmWidgetState extends State<FilmWidget> {
  Future<List<Film>> loadFilmList() async {
    return await ReadData().loadData();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Film>>(
      future: loadFilmList(),
      builder: (BuildContext context, AsyncSnapshot<List<Film>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
              child: Text('Error: ${snapshot.error}',
                  style: TextStyle(color: Colors.red)));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
              child: Text('No data available',
                  style: TextStyle(color: Colors.grey)));
        } else {
          List<Film> lstFilm = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
            physics:
                const NeverScrollableScrollPhysics(), // Prevents scrolling in nested ListView
            itemCount: lstFilm.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: itemFilmView(context, lstFilm[index]),
              );
            },
          );
        }
      },
    );
  }
}
