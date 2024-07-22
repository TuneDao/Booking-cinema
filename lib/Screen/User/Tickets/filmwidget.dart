import 'package:flutter/material.dart';
import 'package:project_android/Data/model/filmmodel.dart';
import 'package:project_android/Data/model/movie.dart';
import 'package:project_android/Data/provider/movies_provider.dart';
import 'filmbody.dart';
import '../../../Data/provider/filmprovider.dart';

class FilmWidget extends StatefulWidget {
  const FilmWidget({super.key});

  @override
  State<FilmWidget> createState() => _FilmWidgetState();
}

class _FilmWidgetState extends State<FilmWidget> {
  Future<List<Film_API>> loadFilmList() async {
    return await FilmProvider().loadData();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Film_API>>(
      future: loadFilmList(),
      builder: (BuildContext context, AsyncSnapshot<List<Film_API>> snapshot) {
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
          List<Film_API> lstFilm = snapshot.data!;
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            // Prevents scrolling in nested ListView
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Số lượng item trên mỗi hàng

              mainAxisExtent: 400, // Tỷ lệ chiều cao/chiều rộng của mỗi item
              // Khoảng cách giữa các hàng
            ),
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
