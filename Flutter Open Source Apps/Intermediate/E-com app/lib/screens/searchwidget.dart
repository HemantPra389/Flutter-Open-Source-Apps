// import 'package:flutter/material.dart';
// import 'package:vishal_mega_mart_app/screens/bloc/productbloc.dart';
// import 'package:vishal_mega_mart_app/screens/lastpagewidget.dart';
// import 'package:vishal_mega_mart_app/screens/model/product.dart';


// class SearchPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     bloc.fetchallproduct;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//       ),
//       body: StreamBuilder(
//         stream: bloc.allproduct,
//         builder: (context, AsyncSnapshot<ProductModel> snapshot) {
//           if (snapshot.hasData) {
//             return buildList(snapshot);
//           } else if (snapshot.hasError) {
//             print("==== ERROR ${snapshot.error.toString()}");
//             return Text(snapshot.error.toString());
//           }
//           return Center(child: CircularProgressIndicator());
//         },
//       ),
//     );
//   }

//   Widget buildList(AsyncSnapshot<ProductModel> snapshot) {
//     return GridView.builder(
//       physics: const NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       itemCount: 2,
//       gridDelegate:
//           new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//       itemBuilder: (BuildContext context, int index) {
//         return Commonwidget(
//             brand: snapshot.data!.hits![index].brand.toString(),
//             discription: snapshot.data!.hits![index].name!.cVmmBrandDefault.toString(),
//             //price: snapshot.data!.hits![index].cListprice.toString(),
//             imglink: snapshot.data!.hits![index].cVmmSizeChart!.path.toString());
//       },
//     );
//   }
// }


































import 'package:flutter/material.dart';
import 'package:vishal_mega_mart_app/screens/api.dart';
import 'package:vishal_mega_mart_app/screens/bloc/productbloc.dart';
import 'package:vishal_mega_mart_app/screens/lastpagewidget.dart';
import 'package:vishal_mega_mart_app/screens/model/product.dart';

class Random extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchallproduct();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: StreamBuilder(
        stream: bloc.allproduct,
        builder: (context, AsyncSnapshot<ProductModel> snapshot) {
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

  Widget buildList(AsyncSnapshot<ProductModel> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data!.hits!.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Commonwidgets(
            brand: snapshot.data!.hits![index].brand.toString(),
            discription: snapshot.data!.hits![index].name!.cVmmBrandDefault.toString(),
            //price: snapshot.data!.hits![index].cListprice.toString(),
            imglink: snapshot.data!.hits![index].cVmmSizeChart!.path.toString()
            );
        });
  }
}