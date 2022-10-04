import 'package:flutter/material.dart';
import 'package:vishal_mega_mart_app/screens/bloc/productlistbloc.dart';
import 'package:vishal_mega_mart_app/screens/lastpagewidget.dart';
import 'package:vishal_mega_mart_app/screens/model/lastmodel.dart';
import 'package:vishal_mega_mart_app/screens/model/productlist.dart';

import 'bloc/productlistbloc.dart';

class LastPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchallproductlist();
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      // ),
      body: StreamBuilder(
        stream: bloc.allproductlist,
        builder: (context, AsyncSnapshot<ProductListModel> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<ProductListModel> snapshot) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: snapshot.data!.hits!.length,
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return Commonwidget(
            brand: snapshot.data!.hits![index].cBrand.toString(),
            discription: snapshot.data!.hits![index].productName.toString(),
            price: snapshot.data!.hits![index].cListprice.toString(),
            imglink: snapshot.data!.hits![index].image!.link.toString());
      },
    );
  }
}
