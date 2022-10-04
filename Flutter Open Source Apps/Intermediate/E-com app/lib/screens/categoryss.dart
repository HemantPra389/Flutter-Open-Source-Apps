import 'package:flutter/material.dart';
import 'package:vishal_mega_mart_app/screens/bloc/categorybloc.dart';
import 'package:vishal_mega_mart_app/screens/category.dart';
import 'package:vishal_mega_mart_app/screens/model/category_section.dart';
import 'package:vishal_mega_mart_app/screens/model/category_section.dart';

import 'model/category_section.dart';

class MovieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchallcategory();
    return Scaffold(
      body: StreamBuilder(
        stream: bloc.allcategory,
        builder: (context, AsyncSnapshot<CategorySection> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 9,
              itemBuilder: (BuildContext context, int index) => CategoriesItem(
                categoryName: snapshot.data!.categories![index].name!.descriptionDefault,
                image: snapshot.data?.categories?[index].thumbnail,
              ),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
